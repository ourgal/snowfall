{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule cfgNixos mkOpt';
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/xhofe/alist-aria2:${cfg.version}";
      ports = [ "${toString cfg.port}:5244" ];
      volumes = [ "${cfg.nfs}${cfg.name}_config:/opt/alist/data" ];
      environment = {
        PUID = "0";
        PGID = "0";
        UMASK = "022";
      };
      extraOptions = [ "--network=proxy" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "alist";
    port = mkOpt' int 5244;
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
