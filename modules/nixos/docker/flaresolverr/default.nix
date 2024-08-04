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
      inherit name version ports;
      image = "flaresolverr/flaresolverr";
      env = {
        TZ = "Asia/Shanghai";
        LOG_LEVEL = "info";
      };
      containerPorts = 8191;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "flaresolverr";
    ports = mkOpt' port 8191;
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
