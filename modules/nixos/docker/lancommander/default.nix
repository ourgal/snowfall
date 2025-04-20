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
    arionProj
    dockerOpts
    getDirname
    mkFireholRule
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value =
    (arionProj {
      inherit cfg;
      inherit (lib.${namespace}.sources."docker-${name}") src;
      config = "/config";
      env = {
        TZ = "Asia/Shanghai";
        PUID = "1000";
        PGID = "1000";
      };
      containerPorts = ports;
    })
    // {
      ${namespace} = mkFireholRule {
        inherit name;
        tcp = cfg.ports;
      };
    };
  name = getDirname _name;
  ports = [
    1337
    35891
  ];
  extraOpts = dockerOpts { inherit name ports; };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
