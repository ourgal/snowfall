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
        image = "linuxserver/freshrss";
        config = "/config";
        env = {
          PGID = "1000";
          PUID = "1000";
          TZ = "Asia/Shanghai";
        };
        depends = [ "${name}_db" ];
        containerPorts = 80;
      }
      {
        inherit name nfs nfsPath;
        image = "mariadb";
        env = {
          MYSQL_PASSWORD = lib.strings.fileContents ./secret.key;
        };
      }
    ];
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
