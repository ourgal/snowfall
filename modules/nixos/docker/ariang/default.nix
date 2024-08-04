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
      image = "leonismoe/ariang";
      containerPorts = 8080;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "ariang";
    ports = mkOpt' port 8080;
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
