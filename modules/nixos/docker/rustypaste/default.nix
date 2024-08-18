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
      image = "orhunp/rustypaste";
      env = {
        CONFIG = "/config/config.toml";
      };
      config = "/config";
      volumes = "upload:/app/upload";
      containerPorts = 8000;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "rustypaste";
    ports = mkOpt' port 8000;
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
