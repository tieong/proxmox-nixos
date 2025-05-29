{
  lib,
  stdenv,
  fetchgit,
  perl538,
  dtach,
  lxc,
  openssh,
  pve-common,
  pve-cluster,
  gnutar,
  xz,
  pve-storage,
  pve-guest-common,
  e2fsprogs,
  tzdata,
}:

let
  perlDeps = with perl538.pkgs; [
    pve-guest-common
    pve-common
    pve-cluster
    pve-storage
  ];
  perlEnv = perl538.withPackages (_: perlDeps);
in

perl538.pkgs.toPerlModule (
  stdenv.mkDerivation rec {
    pname = "pve-container";
    version = "5.2.2";

    src = fetchgit {
      url = "git://git.proxmox.com/git/${pname}.git";
      rev = "a39c5b0617e15aabf5259f9743337beb16c2c173";
      hash = "sha256-lM4QG4ezzUxr4N0aJ3mRYgiq6OouGJwfUcz4OjHugkw=";
    };

    sourceRoot = "${src.name}/src";

    # See: https://forum.proxmox.com/threads/lxc-container-creation-failing-dsa-ssh-key-generation-error.155813/
    patches = [
      ./fix-dsa-keys.patch
      ./lxc-includes.patch
      ./fix-lxc-detach.patch
    ];

    postPatch = ''
      sed -i Makefile \
        -e "s/pct.1 pct.conf.5 pct.bash-completion pct.zsh-completion //" \
        -e "s,/usr/share/lxc,$NIX_BUILD_TOP/lxc," \
        -e "/pve-doc-generator/d" \
        -e "/PVE_GENERATING_DOCS/d" \
        -e "/SERVICEDIR/d" \
        -e "/BASHCOMPLDIR/d" \
        -e "/ZSHCOMPLDIR/d" \
        -e "/MAN1DIR/d" \
        -e "/MAN5DIR/d"
    '';

    buildInputs = [ perlEnv ];
    propagatedBuildInputs = perlDeps;
    dontPatchShebangs = true;

    postConfigure = ''
      cp -r ${lxc}/share/lxc $NIX_BUILD_TOP/
      chmod -R +w $NIX_BUILD_TOP/lxc
    '';

    makeFlags = [
      "DESTDIR=$(out)"
      "PREFIX=$(out)"
      "SBINDIR=$(out)/.bin"
      "PERLDIR=$(out)/${perl538.libPrefix}/${perl538.version}"
    ];

    # postInstall = ''
    #   cp -r ${lxc}/share/lxc $out/share/
    # '';

    postFixup = ''
      find $out -type f | xargs sed -i \
        -e "s|/usr/bin/dtach|${dtach}/bin/dtach|" \
        -e "s|/usr/bin/ssh|${openssh}/bin/ssh|" \
        -e "s|mkfs.ext4|${e2fsprogs}/bin/mkfs.ext4|" \
        -e "s|/usr/bin/vncterm||" \
        -e "s|/usr/bin/termproxy||" \
        -e "s|/usr/bin/lxc|${lxc}/bin/lxc|" \
        -e "s|/usr/share/lxc|$out/share/lxc|" \
        -e "s|/usr/share/zoneinfo|${tzdata}/share/zoneinfo|"

      sed -i $out/lib/perl5/site_perl/5.38.2/PVE/LXC/Create.pm \
        -e "s|'tar'|'${gnutar}/bin/tar'|"

      sed -i $out/lib/perl5/site_perl/5.38.2/PVE/LXC/Create.pm \
        -e "s|$mechanism eq '${gnutar}'|$mechanism eq 'tar'|"

      patchShebangs $out/share/lxc/lxcnetaddbr
      patchShebangs $out/share/lxc/pve-container-stop-wrapper
      patchShebangs $out/share/lxc/hooks/lxc-pve-autodev-hook
      patchShebangs $out/share/lxc/hooks/lxc-pve-prestart-hook
      patchShebangs $out/share/lxc/hooks/lxc-pve-poststop-hook

      sed -i $out/share/lxc/hooks/lxc-pve-prestart-hook \
        -e "s/-T//" \
        -e "1s|$| -I$out/${perl538.libPrefix}/${perl538.version}|"
    '';

    passthru.updateScript = [
      ../update.py
      pname
      "--url"
      src.url
    ];

    meta = with lib; {
      description = "Proxmox VE container manager & runtime";
      homepage = "git://git.proxmox.com/?p=pve-container.git";
      license = licenses.agpl3Plus;
      maintainers = with maintainers; [
        camillemndn
        julienmalka
      ];
      platforms = platforms.linux;
    };
  }
)
