{
  lib,
  fetchgit,
  rustPlatform,
  mkRegistry,
  systemdLibs
}:

let
  sources = import ./sources.nix;
  registry = mkRegistry sources;
in
rustPlatform.buildRustPackage rec {
  pname = "pve-lxc-syscalld";
  version = "1.3.0";

  src = fetchgit {
    url = "git://git.proxmox.com/git/pve-lxc-syscalld.git";
    rev = "1a98063bd9a3876cc699bb22fa8c1a1bda02ef3d";
    hash = "sha256-SEFeeJgK0Qw7st9eK1k8g3gJkQ+li5Ucfdj1GWIjj1c=";
  };
  
  # postPatch = ''
  #   rm -rf .cargo
  #   cp ${./Cargo.lock} Cargo.lock
  #   cp ${./Cargo.toml} Cargo.toml
  # '';

  cargoLock = {
    lockFile = ./Cargo.lock;
    allowBuiltinFetchGit = true;
  };
  
  prePatch = ''
    rm .cargo/config.toml
    cp ${./Cargo.lock} Cargo.lock
  '';

  # passthru.registry = registry;

  # passthru.updateScript = [
  #   ../update.py
  #   pname
  #   "--url"
  #   src.url
  #   "--prefix"
  #   "pve-lxc-syscalld: bump version to"
  #   "--root"
  #   pname
  # ];

  # REPOID = "lol";

  # cargoVendorDir = craneLib.vendorCargoDeps {
  #   cargoLock = ./Cargo.lock;
  #   overrideVendorGitCheckout =
  #     ps: drv:
  #     if (lib.any isProxmoxRS ps) then
  #       (drv.overrideAttrs (_old: {
  #         postPatch = ''
  #           rm .cargo/config 
  #         '';
  #       }))
  #     else
  #       drv;
  # };

  buildInputs = [
    systemdLibs
  ];

  meta = with lib; {
    description = "seccomp syscall proxy for PVE LXC containers";
    homepage = "git://git.proxmox.com/?p=pve-lxc-syscalld.git.git";
    maintainers = with maintainers; [
      camillemndn
      julienmalka
    ];
    mainProgram = "pve-lxc-syscalld";
  };
}
