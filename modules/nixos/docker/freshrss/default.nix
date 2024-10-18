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
  value = arionProjs [
    {
      inherit cfg;
      image = "linuxserver/freshrss";
      config = "/config";
      env = {
        PGID = "1000";
        PUID = "1000";
        TZ = "Asia/Shanghai";
      };
      depends = [ "${cfg.name}_db" ];
      containerPorts = ports;
    }
    {
      inherit cfg;
      ports = [ ];
      image = "mariadb";
      env = {
        MYSQL_PASSWORD = lib.strings.fileContents ./secret.key;
      };
    }
  ];
  name = "freshrss";
  ports = 80;
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
