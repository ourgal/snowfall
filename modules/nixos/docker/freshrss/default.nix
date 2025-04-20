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
  value =
    (arionProjs [
      {
        inherit cfg;
        inherit (lib.${namespace}.sources."docker-${name}") src;
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
        src = { };
        ports = [ ];
        image = "mariadb";
        env = {
          MYSQL_PASSWORD = lib.strings.fileContents ./secret.key;
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
  ports = 80;
  extraOpts = dockerOpts { inherit name ports; };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
