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
  sshKeys = config.${namespace}.user.sshKeys.home;
  value = {
    virtualisation.arion.projects.${cfg.name}.settings = {
      services.${cfg.name}.service = {
        name = cfg.name;
        image = "docker.io/charmcli/soft-serve:${cfg.version}";
        ports = dockerPorts cfg.ports [
          23232
          23231
          23233
          9418
        ];
        environment = {
          SOFT_SERVE_INITIAL_ADMIN_KEYS = sshKeys;
        };
        volumes = [ "config:/soft-serve" ];
        restart = "unless-stopped";
        networks = [ "proxy" ];
      };
      networks.proxy.name = "proxy";
      docker-compose.volumes = dockerVolumes "config" cfg.name cfg.nfs cfg.nfsPath;
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "soft-serve";
    ports = mkOpt' (either port (listOf port)) [
      23232
      23231
      23233
      9418
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
