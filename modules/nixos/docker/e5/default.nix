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
    image = "hanhongyong/ms365-e5-renew-x";
    config = "/app/appdata/DataBase";
    env = {
      TZ = "Asia/Shanghai";
    };
    containerPorts = ports;
  };
  name = "e5";
  ports = 1066;
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
