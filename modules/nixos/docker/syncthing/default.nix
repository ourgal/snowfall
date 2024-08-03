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
        image = "docker.io/linuxserver/syncthing:${cfg.version}";
        ports = dockerPorts cfg.ports [
          8384
          22000
          21027
        ];
        volumes = [
          "config:/config"
          "sync:/sync"
        ];
        hostname = config.dot.user.host;
        restart = "unless-stopped";
        networks = [ "proxy" ];
      };
      networks.proxy.name = "proxy";
      docker-compose.volumes = dockerVolumes [
        "config"
        "sync"
      ] cfg.name cfg.nfs cfg.nfsPath;
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "syncthing";
    ports = mkOpt' (either port (listOf port)) [
      8384
      22000
      21027
    ];
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
