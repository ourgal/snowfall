args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    getDirname
    mkFireholRule
    mkOpt'
    cfgNixos
    ;
  cfg = cfgNixos config.${namespace} ./.;
  name = getDirname path;
  value = {
    environment.etc = {
      "${name}/secret".source = ./secret.key;
    };
    services = {
      harmonia = enabled // {
        settings = {
          bind = "[::]:${toString cfg.port}";
          workers = 4;
          max_connection_rate = 256;
          priority = 30;
        };
        signKeyPaths = [ "/etc/${name}/secret" ];
      };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = cfg.port;
    };
  };
  extraOpts = {
    port = mkOpt' lib.types.int 50000;
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
