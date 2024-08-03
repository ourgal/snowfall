{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    dockerPorts
    dockerVolumes
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.arion.projects.${cfg.name}.settings = {
      services.${cfg.name}.service = {
        name = cfg.name;
        image = "docker.io/xhofe/alist-aria2:${cfg.version}";
        ports = dockerPorts cfg.ports 5244;
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
      docker-compose.volumes = dockerVolumes "config" cfg.name cfg.nfs cfg.nfsPath;
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "alist";
    ports = mkOpt' port 5244;
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
