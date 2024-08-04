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
      image = "hanhongyong/ms365-e5-renew-x";
      config = "/app/appdata/DataBase";
      env = {
        TZ = "Asia/Shanghai";
      };
      containerPorts = 1066;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "e5";
    ports = mkOpt' port 1066;
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
