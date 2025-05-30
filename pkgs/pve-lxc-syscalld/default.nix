{
  lib,
  rustPlatform,
  fetchgit,
}:

rustPlatform.buildRustPackage rec {
  pname = "pve-lxc-syscalld";
  version = "2024-05-13";

  src = fetchgit {
    url = "git://git.proxmox.com/git/pve-lxc-syscalld.git";
    rev = "1a98063bd9a3876cc699bb22fa8c1a1bda02ef3d";
    hash = "";
  };

  cargoLock.lockFile = ./Cargo.lock;

  postPatch = ''
    rm .cargo/config
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  meta = with lib; {
    description = "Alternative to Perl XS for Rust";
    homepage = "git://git.proxmox.com/?p=pve-lxc-syscalld.git";
    license = with licenses; [ ];
    maintainers = with maintainers; [
      camillemndn
      julienmalka
    ];
    platforms = platforms.linux;
  };
}
