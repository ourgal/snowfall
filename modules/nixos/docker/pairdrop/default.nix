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
      image = "linuxserver/pairdrop";
      env = {
        PUID = 1000;
        PGID = 1000;
        TZ = "Asia/Shanghai";
      };
      containerPorts = 3000;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "pairdrop";
    ports = mkOpt' port 3000;
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
