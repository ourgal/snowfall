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
      image = "docker.io/tindy2013/subconverter:${cfg.version}";
      ports = dockerPots cfg.port;
      volumes = [ "${cfg.nfs}${cfg.name}_config:/base" ];
      environment = {
        TZ = "Asia/Shanghai";
      };
      extraOptions = [ "--network=proxy" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "subconverter";
    port = mkOpt' (either port (listOf port)) 25500;
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
