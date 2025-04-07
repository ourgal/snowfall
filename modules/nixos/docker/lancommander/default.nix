args:
let
  inherit (args) namespace lib config;
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
  name = getDirname path;
  ports = [
    1337
    35891
  ];
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
