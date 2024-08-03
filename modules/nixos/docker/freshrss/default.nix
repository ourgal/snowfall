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
      services = {
        ${cfg.name}.service = {
          name = cfg.name;
          image = "docker.io/linuxserver/freshrss:${cfg.version}";
          ports = dockerPorts cfg.ports 80;
          volumes = [ "config:/config" ];
          environment = {
            PGID = "1000";
            PUID = "1000";
            TZ = "Asia/Shanghai";
          };
          depends_on = [ "mariadb-${cfg.name}" ];
          restart = "unless-stopped";
          networks = [ "proxy" ];
        };
        "mariadb-${cfg.name}".service = {
          name = "mariadb-${cfg.name}";
          image = "docker.io/mariadb";
          volumes = [ "db:/var/lib/mysql" ];
          environment = {
            MYSQL_DATABASE = "freshrss";
            MYSQL_PASSWORD = lib.strings.fileContents ./secret.key;
            MYSQL_RANDOM_ROOT_PASSWORD = "1";
            MYSQL_USER = "freshrss";
          };
          restart = "unless-stopped";
          networks = [ "proxy" ];
        };
      };
      networks.proxy.name = "proxy";
      docker-compose.volumes = dockerVolumes [
        "config"
        "db"
      ] cfg.name cfg.nfs cfg.nfsPath;
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "freshrss";
    ports = mkOpt' port 5000;
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
