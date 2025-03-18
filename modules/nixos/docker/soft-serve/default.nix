args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProj
    dockerOpts
    ;
  cfg = cfgNixos config.${namespace} ./.;
  sshKeys = config.${namespace}.user.sshKeys.home;
  value =
    (arionProj {
      inherit cfg;
      image = "charmcli/soft-serve";
      env = {
        SOFT_SERVE_INITIAL_ADMIN_KEYS = sshKeys;
      };
      config = "/soft-serve";
      containerPorts = ports;
    })
    // {
      ${namespace}.user.ports = [ cfg.ports ];
    };
  name = "soft-serve";
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
