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
  sshKeys = config.${namespace}.user.sshKeys.home;
  value =
    (arionProj {
      inherit cfg;
      inherit (lib.${namespace}.sources."docker-${name}") src;
      env = {
        SOFT_SERVE_INITIAL_ADMIN_KEYS = sshKeys;
      };
      config = "/soft-serve";
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
    23232
    23231
    23233
    9418
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
