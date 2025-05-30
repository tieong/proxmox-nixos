{
  lib,
  fetchgit,
  pkg-config,
  openssl,
  zstd,
  clang,
  libclang,
  libuuid,
  systemdLibs,
  craneLib,
  apt,
  sg3_utils,
  libxcrypt,
  acl,
  linux-pam,
}:

let
  isProxmoxRS = p: lib.hasPrefix "git+https://github.com/proxmox/proxmox-rs.git" p.source;
in
craneLib.buildPackage {
  pname = "pve-lxc-syscalld";
  version = "2024-06-13";

  src = fetchgit {
    url = "git://git.proxmox.com/git/pve-lxc-syscalld.git";
    rev = "1a98063bd9a3876cc699bb22fa8c1a1bda02ef3d";
    hash = "";
  };

  postPatch = ''
    rm -rf .cargo
    cp ${./Cargo.lock} Cargo.lock
    cp ${./Cargo.toml} Cargo.toml
  '';

  REPOID = "lol";

  cargoVendorDir = craneLib.vendorCargoDeps {
    cargoLock = ./Cargo.lock;
    overrideVendorGitCheckout =
      ps: drv:
      if (lib.any isProxmoxRS ps) then
        (drv.overrideAttrs (_old: {
          postPatch = ''
            rm .cargo/config 
          '';
        }))
      else
        drv;
  };

  nativeBuildInputs = [
    pkg-config
    clang
    zstd
    zstd.dev
    apt
    sg3_utils
    libxcrypt
    acl
    linux-pam
  ];

  buildInputs = [
    openssl
    zstd
    clang
    zstd.dev
    libuuid
    systemdLibs
  ];

  # LIBCLANG_PATH = "${libclang.lib}/lib";

  # cargoTestExtraArgs = "-- --skip=test_get_current_release_codename rrd::tests::load_and_save_rrd_v2 rrd::tests::upgrade_from_rrd_v1";

  meta = with lib; {
    description = "";
    homepage = "git://git.proxmox.com/?p=proxmox.git";
    maintainers = with maintainers; [
      camillemndn
      julienmalka
    ];
    mainProgram = "proxmox";
  };
}
