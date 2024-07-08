{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule cfgNixos mkOpt';
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/flaresolverr/flaresolverr:${cfg.version}";
      environment = {
        TZ = "Asia/Shanghai";
        LOG_LEVEL = "info";
      };
      ports = [ "0.0.0.0:${toString cfg.port}:8191" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "flaresolverr";
    port = mkOpt' int 8191;
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
