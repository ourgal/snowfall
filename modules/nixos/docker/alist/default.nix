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
      image = "xhofe/alist-aria2";
      config = "/opt/alist/data";
      env = {
        PUID = "0";
        PGID = "0";
        UMASK = "022";
      };
      containerPorts = 5244;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "alist";
    ports = mkOpt' port 5244;
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
