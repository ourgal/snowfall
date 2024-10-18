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
    image = "linuxserver/pairdrop";
    env = {
      PUID = 1000;
      PGID = 1000;
      TZ = "Asia/Shanghai";
    };
    containerPorts = ports;
  };
  name = "pairdrop";
  ports = 3000;
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
