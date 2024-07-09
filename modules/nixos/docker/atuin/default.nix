{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    dockerPots
    ;
  cfg = cfgNixos config.${namespace} ./.;
  password = args.lib.strings.fileContents ./password.key;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "ghcr.io/atuinsh/atuin:${cfg.version}";
      environment = {
        ATUIN_DB_URI = "postgres://atuin:${password}@atuin_db/atuin";
        ATUIN_HOST = "0.0.0.0";
        ATUIN_OPEN_REGISTRATION = "true";
      };
      volumes = [ "${cfg.nfs}${cfg.name}_config:/config:rw" ];
      ports = dockerPots cfg.port;
      cmd = [
        "server"
        "start"
      ];
      dependsOn = [ "atuin_db" ];
      log-driver = "journald";
      extraOptions = [ "--network=proxy" ];
    };
    virtualisation.oci-containers.containers."${cfg.name}_db" = {
      image = "postgres:14";
      environment = {
        POSTGRES_DB = "atuin";
        POSTGRES_PASSWORD = password;
        POSTGRES_USER = "atuin";
      };
      volumes = [ "${cfg.nfs}${cfg.name}_db:/var/lib/postgresql/data:rw" ];
      log-driver = "journald";
      extraOptions = [ "--network=proxy" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "atuin";
    port = mkOpt' (either port (listOf port)) 8888;
    nfs = mkOpt' str "";
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
