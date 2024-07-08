{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule cfgNixos mkOpt';
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/linuxserver/freshrss:${cfg.version}";
      ports = [ "${toString cfg.port}:80" ];
      volumes = [ "${cfg.nfs}${cfg.name}_config:/config" ];
      environment = {
        PGID = "1000";
        PUID = "1000";
        TZ = "Asia/Shanghai";
      };
      dependsOn = [ "mariadb-${cfg.name}" ];
      extraOptions = [ "--network=proxy" ];
    };
    virtualisation.oci-containers.containers."mariadb-${cfg.name}" = {
      image = "docker.io/mariadb";
      volumes = [ "${cfg.nfs}${cfg.name}_db:/var/lib/mysql" ];
      environment = {
        MYSQL_DATABASE = "freshrss";
        MYSQL_PASSWORD = lib.string.fileContents ./secret.key;
        MYSQL_RANDOM_ROOT_PASSWORD = "1";
        MYSQL_USER = "freshrss";
      };
      extraOptions = [ "--network=proxy" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "freshrss";
    port = mkOpt' int 5000;
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
