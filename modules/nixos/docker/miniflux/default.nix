{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    arionProjs
    ;
  cfg = cfgNixos config.${namespace} ./.;
  dbPass = args.lib.strings.fileContents ./dbPass.key;
  adminPass = args.lib.strings.fileContents ./adminPass.key;
  value =
    with cfg;
    arionProjs [
      {
        inherit
          name
          version
          ports
          nfs
          nfsPath
          ;
        image = "miniflux/miniflux";
        config = "/config";
        env = {
          DATABASE_URL = "postgres://miniflux:${dbPass}@${name}_db/miniflux?sslmode=disable";
          RUN_MIGRATIONS = 1;
          CREATE_ADMIN = 1;
          ADMIN_USERNAME = "fairever";
          ADMIN_PASSWORD = adminPass;
          POLLING_PARSING_ERROR_LIMIT = 1;
        };
        depends = [ "${name}_db" ];
        containerPorts = 8080;
      }
      {
        inherit name nfs nfsPath;
        image = "postgres";
        version = "15";
        env = {
          POSTGRES_PASSWORD = dbPass;
        };
      }
    ];
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
