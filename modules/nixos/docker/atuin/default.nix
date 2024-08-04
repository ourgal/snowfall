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
  password = args.lib.strings.fileContents ./password.key;
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
        image = "atuinsh/atuin";
        imageHost = "ghcr.io";
        env = {
          ATUIN_DB_URI = "postgres://atuin:${password}@${name}_db/atuin";
          ATUIN_HOST = "0.0.0.0";
          ATUIN_OPEN_REGISTRATION = "true";
        };
        config = "/config";
        cmd = [
          "server"
          "start"
        ];
        depends = "${name}_db";
        containerPorts = 8888;
      }
      {
        inherit name nfs nfsPath;
        image = "postgres";
        version = "14";
        env = {
          POSTGRES_PASSWORD = password;
        };
      }
    ];
  extraOpts = with lib.types; {
    name = mkOpt' str "atuin";
    ports = mkOpt' port 8888;
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
