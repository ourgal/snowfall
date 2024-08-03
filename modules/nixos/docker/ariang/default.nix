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
        image = "docker.io/leonismoe/ariang:${cfg.version}";
        ports = dockerPorts cfg.ports 8080;
        environment = {
          TZ = "Asia/Shanghai";
        };
        restart = "unless-stopped";
        networks = [ "proxy" ];
      };
      networks.proxy.name = "proxy";
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "ariang";
    ports = mkOpt' port 8080;
    nfs = mkOpt' str "";
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
