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
    image = "orhunp/rustypaste";
    env = {
      CONFIG = "/config/config.toml";
    };
    config = "/config";
    volumes = "upload:/app/upload";
    containerPorts = ports;
  };
  name = "rustypaste";
  ports = 8000;
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
