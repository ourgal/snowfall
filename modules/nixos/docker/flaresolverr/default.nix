{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProj
    dockerOpts
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = arionProj {
    inherit cfg;
    image = "flaresolverr/flaresolverr";
    env = {
      TZ = "Asia/Shanghai";
      LOG_LEVEL = "info";
    };
    containerPorts = ports;
  };
  name = "flaresolverr";
  ports = 8191;
  extraOpts = dockerOpts { inherit name ports; };
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
