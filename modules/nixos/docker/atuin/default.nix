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
  password = args.lib.strings.fileContents ./password.key;
  value = {
    virtualisation.arion.projects.${cfg.name}.settings = {
      services = {
        ${cfg.name}.service = {
          name = cfg.name;
          image = "ghcr.io/atuinsh/atuin:${cfg.version}";
          environment = {
            ATUIN_DB_URI = "postgres://atuin:${password}@${cfg.name}_db/atuin";
            ATUIN_HOST = "0.0.0.0";
            ATUIN_OPEN_REGISTRATION = "true";
          };
          volumes = [ "config:/config:rw" ];
          ports = dockerPorts cfg.ports;
          command = [
            "server"
            "start"
          ];
          depends_on = [ "${cfg.name}_db" ];
          restart = "unless-stopped";
          networks = [ "proxy" ];
        };
        "${cfg.name}_db".service = {
          name = "${cfg.name}_db";
          image = "postgres:14";
          environment = {
            POSTGRES_DB = "atuin";
            POSTGRES_PASSWORD = password;
            POSTGRES_USER = "atuin";
          };
          volumes = [ "db:/var/lib/postgresql/data:rw" ];
          restart = "unless-stopped";
          networks = [ "proxy" ];
        };
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
        db = {
          driver_opts = {
            type = "nfs";
            o = "addr=${cfg.nfs},nfsvers=4";
            device = ":${cfg.nfsPath}/${cfg.name}_db";
          };
        };
      };
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "atuin";
    ports = mkOpt' (either port (listOf port)) 8888;
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
