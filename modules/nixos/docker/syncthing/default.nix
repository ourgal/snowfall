args:
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
    image = "linuxserver/syncthing";
    config = "/config";
    volumes = "sync:/sync";
    hostname = config.dot.user.host;
    containerPorts = ports;
  };
  name = "syncthing";
  ports = [
    8384
    22000
    21027
  ];
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
