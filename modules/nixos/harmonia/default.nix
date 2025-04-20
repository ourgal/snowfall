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
    enabled
    getDirname
    mkFireholRule
    mkOpt'
    cfgNixos
    ;
  cfg = cfgNixos config.${namespace} ./.;
  name = getDirname _name;
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
    port = mkOpt' lib.types.port 50000;
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
