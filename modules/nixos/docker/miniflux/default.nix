args:
let
  inherit (args)
    namespace
    lib
    config
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProjs
    dockerOpts
    getDirname
    mkFireholRule
    ;
  cfg = cfgNixos config.${namespace} ./.;
  dbPass = lib.strings.fileContents ./dbPass.key;
  adminPass = lib.strings.fileContents ./adminPass.key;
  value =
    (arionProjs [
      {
        inherit cfg;
        inherit (lib.${namespace}.sources."docker-${name}") src;
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
        src = { };
        ports = [ ];
        image = "postgres";
        version = "15";
        env = {
          POSTGRES_PASSWORD = dbPass;
        };
      }
    ])
    // {
      ${namespace} = mkFireholRule {
        inherit name;
        tcp = cfg.ports;
      };
    };
  name = getDirname _name;
  ports = 8080;
  extraOpts = dockerOpts { inherit name ports; };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
