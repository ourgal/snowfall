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
  password = lib.strings.fileContents ./password.key;
  value =
    (arionProjs [
      {
        inherit cfg;
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
        ports = [ ];
        image = "postgres";
        version = "14";
        env = {
          POSTGRES_PASSWORD = password;
        };
      }
    ])
    // {
      ${namespace}.user.ports = [ cfg.ports ];
    };
  name = "atuin";
  ports = 8888;
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
