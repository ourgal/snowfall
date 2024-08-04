{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    arionProj
    ;
  cfg = cfgNixos config.${namespace} ./.;
  sshKeys = config.${namespace}.user.sshKeys.home;
  value =
    with cfg;
    arionProj {
      inherit
        name
        version
        ports
        nfs
        nfsPath
        ;
      image = "charmcli/soft-serve";
      env = {
        SOFT_SERVE_INITIAL_ADMIN_KEYS = sshKeys;
      };
      config = "/soft-serve";
      containerPorts = [
        23232
        23231
        23233
        9418
      ];
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "soft-serve";
    ports = mkOpt' (either port (listOf port)) [
      23232
      23231
      23233
      9418
    ];
    nfs = mkOpt' str "";
    nfsPath = mkOpt' str "/docker";
    version = mkOpt' str "latest";
  };
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
