{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    arionProj
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value =
    with cfg;
    arionProj {
      inherit name version ports;
      image = "mpepping/cyberchef";
      containerPorts = 8000;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "cyberchef";
    ports = mkOpt' port 8000;
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
