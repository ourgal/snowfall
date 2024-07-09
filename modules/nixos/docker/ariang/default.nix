{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    dockerPots
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/leonismoe/ariang:${cfg.version}";
      ports = dockerPots cfg.port;
      environment = {
        TZ = "Asia/Shanghai";
      };
      extraOptions = [ "--network=proxy" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "ariang";
    port = mkOpt' (either port (listOf port)) 8080;
    nfs = mkOpt' str "";
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
