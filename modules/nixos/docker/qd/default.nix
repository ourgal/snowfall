args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProjs
    dockerOpts
    getDirname
    mkFireholRule
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value =
    (arionProjs [
      {
        inherit cfg;
        inherit (lib.${namespace}.sources."docker-${name}") src;
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
        src = { };
        ports = [ ];
        name = "redis";
        projectName = cfg.name;
        image = "redis";
        version = "alpine";
        volumes = "data:/data";
      }
    ])
    // {
      ${namespace} = mkFireholRule {
        inherit name;
        tcp = cfg.ports;
      };
    };
  name = getDirname path;
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
