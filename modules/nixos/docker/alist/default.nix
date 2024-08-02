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
        image = "docker.io/xhofe/alist-aria2:${cfg.version}";
        ports = dockerPorts cfg.ports;
        volumes = [ "config:/opt/alist/data" ];
        environment = {
          PUID = "0";
          PGID = "0";
          UMASK = "022";
        };
        restart = "unless-stopped";
        networks = [ "proxy" ];
      };
      networks.proxy.name = "proxy";
      docker-compose.volumes = {
        config = {
          driver_opts = {
            type = "nfs";
            o = "addr=${cfg.nfs},nfsvers=4";
            device = ":${cfg.nfsPath}/${cfg.name}_config";
          };
        };
      };
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "alist";
    ports = mkOpt' (either port (listOf port)) 5244;
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
