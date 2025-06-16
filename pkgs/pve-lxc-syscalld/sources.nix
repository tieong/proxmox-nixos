[
  {
    name = "librust-pathpatterns-dev";
    url = "git://git.proxmox.com/git/pathpatterns.git";
    rev = "fda9f89ee0f2229f2863f6e9cfb4fed3b9ce0614";

    sha256 = "0if1d42mzv5dbyy7cjlj3i7snnndxcf6n56fmvsgfjhshn45alm4";
    crates = [
      {
        name = "pathpatterns";
        path = ".";
      }
    ];
  }
  {
    name = "librust-perlmod-dev";
    url = "git://git.proxmox.com/git/perlmod.git";

    # rev = "5dbce0d3d3d89a9fa2d470444d1c1c8b3a780cbe";
    # patches = [ ../perlmod/remove_safe_putenv.patch ];
    # sha256 = "05q7bqf93qyz9054wb7x7kx59v7ssc41p79rzkf1g8fzws7ga8q7";

    rev = "1544fc13d7196152409467db416f1791ed121fc3";
    patches = [ ../perlmod/remove_safe_putenv.patch ];
    sha256 = "03m75w3hz0qx05kz09fn9hgaxiyya72bxv3id4mcjj10csshhyzw";

    crates = [
      {
        name = "perlmod";
        path = "perlmod";
      }
    ];
  }
  {
    name = "librust-perlmod-macro-dev";
    url = "git://git.proxmox.com/git/perlmod.git";

    # rev = "5dbce0d3d3d89a9fa2d470444d1c1c8b3a780cbe";
    # patches = [ ../perlmod/remove_safe_putenv.patch ];
    # sha256 = "05q7bqf93qyz9054wb7x7kx59v7ssc41p79rzkf1g8fzws7ga8q7";

    rev = "3420df88a8edf6c26264a7534a27d4105de194f7";
    patches = [ ../perlmod/remove_safe_putenv.patch ];
    sha256 = "0i26mdqgnmg119m6m4mwl256pcpgh4xk8njsi8dyl9gmf5hv8cni";

    crates = [
      {
        name = "perlmod-macro";
        path = "perlmod-macro";
      }
    ];
  }
  {
    name = "librust-proxmox-api-macro-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "7bc85c05c97ba3f2ecbdcf43ee83e8f24355311a";

    sha256 = "1asbm2vam4rd364dvv488jwwyxk2p1c2z6pvdv5wzh0kllcd31yd";
    crates = [
      {
        name = "proxmox-api-macro";
        path = "proxmox-api-macro";
      }
    ];
  }
  {
    name = "librust-proxmox-async-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "27c8106d7b512719610f1d44d7245799815c63a4";

    sha256 = "1yb514salgan7y20i8c3xjsxp5nbyg23cf1kvgvbjpv4skk3yins";
    crates = [
      {
        name = "proxmox-async";
        path = "proxmox-async";
      }
    ];
  }
  {
    name = "librust-proxmox-auth-api-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "e5ff0dc40b968562142764f3595ee0aa7ef3e283";

    sha256 = "0j53cl0221gaavc7qda8zm362brfiglkw0vfxqh3dxbl1qfrl7cp";
    crates = [
      {
        name = "proxmox-auth-api";
        path = "proxmox-auth-api";
      }
    ];
  }
  {
    name = "librust-proxmox-borrow-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "17adc570dba41b09e0cf78b83f67aa4b123858db";

    sha256 = "1z86irrfyb1xxzqawmpp4mapdhi53c5qnxz33zgzbs0rwqcbbrlr";
    crates = [
      {
        name = "proxmox-borrow";
        path = "proxmox-borrow";
      }
    ];
  }
  {
    name = "librust-proxmox-compression-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "4f2a7d971b1e50722c5f10755acb8cfe45c060ba";

    sha256 = "1z853kl7y7z83fvrzibp9hdsv37k9zgh7qmpmj2lms25192fh2q9";
    crates = [
      {
        name = "proxmox-compression";
        path = "proxmox-compression";
      }
    ];
  }
  {
    name = "librust-proxmox-http-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "af2d4c6c86820acd5eb66131cab9022d80bcad5c";

    sha256 = "09s6x5ybp21sx5j132njjbkajfhvadpwj9anf3c7zx22njjj1may";
    crates = [
      {
        name = "proxmox-http";
        path = "proxmox-http";
      }
    ];
  }
  {
    name = "librust-proxmox-io-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "cdf82206764f08354996ddf9ef94d9a93595e7f6";

    sha256 = "1x73bsp2yxb49ls9r7agb0hsra12dpf6amai9cs62xiy86rschiq";
    crates = [
      {
        name = "proxmox-io";
        path = "proxmox-io";
      }
    ];
  }
  {
    name = "librust-proxmox-lang-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "d8ecb8735840e19be20ac7ebd4f22625461ada41";

    sha256 = "0sjkb7nmfs54ngg86sfs9n8ga9g5qmbvs4cc2k15ya5jja8dk828";
    crates = [
      {
        name = "proxmox-lang";
        path = "proxmox-lang";
      }
    ];
  }
  {
    name = "librust-proxmox-metrics-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "ca56a67251f31b38fd2cff09eecfc35ae7a26c07";

    sha256 = "03bi1yavcmrzq2zmsnism6vl1r5nqig8zgnyanmi2z5y80vicb92";
    crates = [
      {
        name = "proxmox-metrics";
        path = "proxmox-metrics";
      }
    ];
  }
  {
    name = "librust-proxmox-openid-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "656ec1e7db319579bbe678dcc20cdc33a677e5e8";

    sha256 = "1s4ay1pmli2zm0y5l4p1hnfkam0z4im330f32hg94jm6rrlyn28m";
    crates = [
      {
        name = "proxmox-openid";
        path = "proxmox-openid";
      }
    ];
  }
  {
    name = "librust-proxmox-resource-scheduling-dev";
    url = "git://git.proxmox.com/git/proxmox-resource-scheduling.git";
    rev = "ba581d98326d1a028f3eb69295dee0b8c78372ec";

    sha256 = "0bxqb1cv1hnvzsylb8cwigy8lhyq9qb89pyj3sj34j1q5810i5a9";
    crates = [
      {
        name = "proxmox-resource-scheduling";
        path = ".";
      }
    ];
  }
  {
    name = "librust-proxmox-rest-server-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "c531c314c6da9df99f0154b02153922dc1bbfd99";

    sha256 = "0swzc4w6520177ch73s40g8w9fr5lvs1dxsdnpqwz5imzpdnakl8";
    crates = [
      {
        name = "proxmox-rest-server";
        path = "proxmox-rest-server";
      }
    ];
  }
  {
    name = "librust-proxmox-router-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "40cb468bef61c98c7e31ac450153c65bc617b5ca";

    sha256 = "06dd083n9yy6j0zng7f1qd0plxizhgyhl2f2g6rvnlvivh0imywg";
    crates = [
      {
        name = "proxmox-router";
        path = "proxmox-router";
      }
    ];
  }
  {
    name = "librust-proxmox-schema-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "2f5b1f26cc0330f797921e21ed581a7a568042e6";

    sha256 = "10ayzyqn461v3a0cxji34g4b3a2ypbxbzmzwx5d2r821m7hqwb2k";
    crates = [
      {
        name = "proxmox-schema";
        path = "proxmox-schema";
      }
    ];
  }
  {
    name = "librust-proxmox-section-config-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "d513ef78361cbdb505b4e0e6dbf74b1a10ee987e";

    sha256 = "1zn02bqp41m6k28i7savc15rk8b5h4lxpks1dcsmly6mmz75cvxg";
    crates = [
      {
        name = "proxmox-section-config";
        path = "proxmox-section-config";
      }
    ];
  }
  {
    name = "librust-proxmox-serde-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "439321763314d8e0cb5575152b06d237af23339c";

    sha256 = "0v81irfp1g8swsn6yhqvf0w3fa7fxphb3r91kd7ij7z3l7fqi9gd";
    crates = [
      {
        name = "proxmox-serde";
        path = "proxmox-serde";
      }
    ];
  }
  {
    name = "librust-proxmox-shared-memory-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "644852296d298b94d1e61d467f0e27990cff4426";

    sha256 = "0qsgydbrkgb7y1aj7h96151w25815rrqkrbr6zgy3gxz404i0wsx";
    crates = [
      {
        name = "proxmox-shared-memory";
        path = "proxmox-shared-memory";
      }
    ];
  }
  {
    name = "librust-proxmox-sortable-macro-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "0bb298b2623c2c8dd2d1bc90b62c096717de5052";

    sha256 = "1dxy2p5fc1wk9jicwia322xvxkayqjrn1f80aq3m2mbh32m0r6fk";
    crates = [
      {
        name = "proxmox-sortable-macro";
        path = "proxmox-sortable-macro";
      }
    ];
  }
  {
    name = "librust-proxmox-subscription-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "6c8191471ee9d992842cbf8d015a167a4c25897b";

    sha256 = "0fy1njimh4ca188hv5j08rnwp54qj8z5r0mvq0ds2m187hfgcqai";
    crates = [
      {
        name = "proxmox-subscription";
        path = "proxmox-subscription";
      }
    ];
  }
  {
    name = "librust-proxmox-sys-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "dd87a120bd0e876aca525ece7fa57a9ef6ae7b46";

    sha256 = "0pp4945774xx9lkj35pb3mmnsspy1f40c76d94gvndhchcrc1dmz";
    crates = [
      {
        name = "proxmox-sys";
        path = "proxmox-sys";
      }
    ];
  }
  {
    name = "librust-proxmox-time-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "2cebe420c1c97a4125ce2cccba60c6632d976bae";

    sha256 = "01p75sx7pwk2c6psvlvim5m6dhy16hjk1dk5dyln2swpk1nw0flf";
    crates = [
      {
        name = "proxmox-time";
        path = "proxmox-time";
      }
    ];
  }
  {
    name = "librust-proxmox-uuid-dev";
    url = "git://git.proxmox.com/git/proxmox.git";
    rev = "78d9b156a841c94686e8131c6eef9fb1be2ab324";

    sha256 = "1rdkwp1ngifhh5s7rbxwljz0iqvv8mdjdv9gfgs14r0d6f7mmw2f";
    crates = [
      {
        name = "proxmox-uuid";
        path = "proxmox-uuid";
      }
    ];
  }
  {
    name = "librust-pxar-dev";
    url = "git://git.proxmox.com/git/pxar.git";
    rev = "29cbeed3e1b52f5eef455cdfa8b5e93f4e3e88f5";

    sha256 = "0qcbkk1lpwg3aln1qnvzc4c4ma150706yz5njgvdv54ycsy6q0wv";
    crates = [
      {
        name = "pxar";
        path = ".";
      }
    ];
  }
]
