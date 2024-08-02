{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    dockerPorts
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.arion.projects.${cfg.name}.settings = {
      services.${cfg.name}.service = {
        name = cfg.name;
        image = "docker.io/flaresolverr/flaresolverr:${cfg.version}";
        environment = {
          TZ = "Asia/Shanghai";
          LOG_LEVEL = "info";
        };
        ports = dockerPorts cfg.ports;
        restart = "unless-stopped";
        networks = [ "proxy" ];
      };
      networks.proxy.name = "proxy";
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "flaresolverr";
    ports = mkOpt' (either port (listOf port)) 8191;
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
