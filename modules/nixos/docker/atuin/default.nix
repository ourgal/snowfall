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
  password = lib.strings.fileContents ./password.key;
  value =
    (arionProjs [
      {
        inherit cfg;
        src = { };
        image = "atuinsh/atuin";
        imageHost = "ghcr.io";
        env = {
          ATUIN_DB_URI = "postgres://atuin:${password}@${cfg.name}_db/atuin";
          ATUIN_HOST = "0.0.0.0";
          ATUIN_OPEN_REGISTRATION = "true";
        };
        config = "/config";
        cmd = [
          "server"
          "start"
        ];
        depends = "${cfg.name}_db";
        containerPorts = ports;
      }
      {
        inherit cfg;
        src = { };
        ports = [ ];
        image = "postgres";
        version = "14";
        env = {
          POSTGRES_PASSWORD = password;
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
  ports = 8888;
  extraOpts = dockerOpts { inherit name ports; };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
