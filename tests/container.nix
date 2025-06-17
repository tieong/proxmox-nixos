{
  name = "pve-container";

  nodes.mypve = {
    services.proxmox-ve = {
      enable = true;
      ipAddress = "192.168.1.1";

      bridges = [ "vmbr0" ];
    };

    users.users.root = {
      subUidRanges = [
        {
          count = 65536;
          startUid = 100000;
        }
      ];
      subGidRanges = [
        {
          count = 65536;
          startGid = 100000;
        }
      ];
    };
  };

  testScript = ''
    machine.start()
    machine.wait_for_unit("pveproxy.service")
    assert "update successful" in machine.succeed("pveam update")
    assert "debian" in machine.succeed("pveam available")
    machine.succeed("pveam download local alpine-3.21-default_20241217_amd64.tar.xz")
    args = (
        "150",
        "local:vztmpl/alpine-3.21-default_20241217_amd64.tar.xz",
        "--hostname=alpine-test",
        "--ostype=alpine",
        "--unprivileged=1",
        "--net0 name=eth0,bridge=vmbr0,ip=dhcp",
        "--storage=local"
    )
    machine.succeed(f"pct create {args}")
    machine.succeed("pct start 150")
  '';
}
