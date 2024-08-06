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
      image = "henryclw/jsonhero-web";
      containerPorts = 8787;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "jsonhero";
    ports = mkOpt' port 8787;
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
