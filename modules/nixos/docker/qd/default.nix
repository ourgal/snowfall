{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProjs
    dockerOpts
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = arionProjs [
    {
      inherit cfg;
      image = "qdtoday/qd";
      config = "/usr/src/app/config";
      env = {
        COOKIE_SECRET = "binux";
        PBKDF2_ITERATIONS = 400;
        AES_KEY = "binux";
        REDISCLOUD_URL = "redis://redis:6379";
      };
      depends = [ "redis" ];
      containerPorts = ports;
    }
    {
      inherit cfg;
      ports = [ ];
      name = "redis";
      projectName = cfg.name;
      image = "redis";
      version = "alpine";
      volumes = "data:/data";
    }
  ];
  name = "qd";
  ports = 80;
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
