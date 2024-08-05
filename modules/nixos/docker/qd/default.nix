{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    arionProjs
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value =
    with cfg;
    arionProjs [
      {
        inherit
          name
          version
          ports
          nfs
          nfsPath
          ;
        image = "qdtoday/qd";
        config = "/usr/src/app/config";
        env = {
          COOKIE_SECRET = "binux";
          PBKDF2_ITERATIONS = 400;
          AES_KEY = "binux";
          REDISCLOUD_URL = "redis://redis:6379";
        };
        depends = [ "redis" ];
        containerPorts = 80;
      }
      {
        inherit nfs nfsPath;
        name = "redis";
        projectName = name;
        image = "redis";
        version = "alpine";
        volumes = "data:/data";
      }
    ];
  extraOpts = with lib.types; {
    name = mkOpt' str "qd";
    ports = mkOpt' port 5000;
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
