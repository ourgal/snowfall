{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule cfgNixos mkOpt';
  cfg = cfgNixos config.${namespace} ./.;
  dbPass = args.lib.strings.fileContents ./dbPass.key;
  adminPass = args.lib.strings.fileContents ./adminPass.key;
  value = {
    virtualisation.arion.projects.${cfg.name}.settings = {
      services = {
        ${cfg.name}.service = {
          name = cfg.name;
          image = "docker.io/miniflux/miniflux:${cfg.version}";
          ports = [ "${toString cfg.ports}:8080" ];
          volumes = [ "config:/config" ];
          environment = {
            DATABASE_URL = "postgres://miniflux:${dbPass}@${cfg.name}-postgres/miniflux?sslmode=disable";
            RUN_MIGRATIONS = 1;
            CREATE_ADMIN = 1;
            ADMIN_USERNAME = "fairever";
            ADMIN_PASSWORD = adminPass;
            POLLING_PARSING_ERROR_LIMIT = 1;
          };
          depends_on = [ "${cfg.name}-postgres" ];
          restart = "unless-stopped";
          networks = [ "proxy" ];
        };
        "${cfg.name}-postgres".service = {
          name = "${cfg.name}-postgres";
          image = "docker.io/postgres:15";
          volumes = [ "db:/var/lib/postgresql/data" ];
          environment = {
            POSTGRES_USER = "miniflux";
            POSTGRES_PASSWORD = dbPass;
            POSTGRES_DB = "miniflux";
          };
          restart = "unless-stopped";
          networks = [ "proxy" ];
          healthcheck = {
            test = [
              "CMD"
              "pg_isready"
              "-U"
              "miniflux"
            ];
            interval = "10s";
            start_period = "30s";
          };
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
    name = mkOpt' str "miniflux";
    ports = mkOpt' port 8080;
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
