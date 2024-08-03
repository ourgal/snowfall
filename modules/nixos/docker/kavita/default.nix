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
        image = "docker.io/linuxserver/kavita:${cfg.version}";
        ports = dockerPorts cfg.ports 5000;
        volumes = [
          "config:/config"
          "${cfg.mount}/books:/books:ro"
          "${cfg.mount}/wenku:/wenku:ro"
        ];
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
    name = mkOpt' str "kavita";
    ports = mkOpt' port 5000;
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
