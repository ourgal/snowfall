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
        image = "docker.io/neosmemo/memos:${cfg.version}";
        ports = dockerPorts cfg.ports 5230;
        volumes = [ "config:/var/opt/memos" ];
        restart = "unless-stopped";
        networks = [ "proxy" ];
      };
      networks.proxy.name = "proxy";
      docker-compose.volumes = dockerVolumes "config" cfg.name cfg.nfs cfg.nfsPath;
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "memos";
    ports = mkOpt' port 5230;
    nfs = mkOpt' str "";
    nfsPath = mkOpt' str "/docker";
    mount = mkOpt' str "";
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
