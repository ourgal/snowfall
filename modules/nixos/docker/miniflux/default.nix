args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProjs
    dockerOpts
    ;
  cfg = cfgNixos config.${namespace} ./.;
  dbPass = lib.strings.fileContents ./dbPass.key;
  adminPass = lib.strings.fileContents ./adminPass.key;
  value =
    (arionProjs [
      {
        inherit cfg;
        image = "miniflux/miniflux";
        config = "/config";
        env = {
          DATABASE_URL = "postgres://miniflux:${dbPass}@${cfg.name}_db/miniflux?sslmode=disable";
          RUN_MIGRATIONS = 1;
          CREATE_ADMIN = 1;
          ADMIN_USERNAME = "fairever";
          ADMIN_PASSWORD = adminPass;
          POLLING_PARSING_ERROR_LIMIT = 0;
        };
        depends = [ "${cfg.name}_db" ];
        containerPorts = ports;
      }
      {
        inherit cfg;
        ports = [ ];
        image = "postgres";
        version = "15";
        env = {
          POSTGRES_PASSWORD = dbPass;
        };
      }
    ])
    // {
      ${namespace} = {
        user.ports = [ cfg.ports ];
        firehol.services = [
          {
            inherit name;
            tcp = cfg.ports;
          }
        ];
      };
    };
  name = "miniflux";
  ports = 8080;
  extraOpts = dockerOpts { inherit name ports; };
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
