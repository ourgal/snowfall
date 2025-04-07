args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProj
    dockerOpts
    mkFireholRule
    getDirname
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value =
    (arionProj {
      inherit cfg;
      inherit (lib.${namespace}.sources."docker-${name}") src;
      containerPorts = ports;
    })
    // {
      ${namespace} = mkFireholRule {
        inherit name;
        tcp = cfg.ports;
      };
    };
  name = getDirname path;
  ports = 8080;
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
