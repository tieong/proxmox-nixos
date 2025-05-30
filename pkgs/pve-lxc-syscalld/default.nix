{
  lib,
  rustPlatform,
  fetchgit,
}:

rustPlatform.buildRustPackage rec {
  pname = "pve-lxc-syscalld";
  version = "1.3.0";

  src = fetchgit {
    url = "git://git.proxmox.com/git/pve-lxc-syscalld.git";
    rev = "1a98063bd9a3876cc699bb22fa8c1a1bda02ef3d";
    hash = "sha256-SEFeeJgK0Qw7st9eK1k8g3gJkQ+li5Ucfdj1GWIjj1c=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "finalfusion-0.14.0" = "17f4bsdzpcshwh74w5z119xjy2if6l2wgyjy56v621skr2r8y904";
    };
  };
  
  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  meta = with lib; {
    description = "PVE LXC Syscalld";
    homepage = "git://git.proxmox.com/?p=pve-lxc-syscalld.git";
    license = with licenses; [ ];
    maintainers = with maintainers; [
      camillemndn
      julienmalka
    ];
    platforms = platforms.linux;
  };
}
