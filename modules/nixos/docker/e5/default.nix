{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule cfgNixos mkOpt';
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/hanhongyong/ms365-e5-renew-x:${cfg.version}";
      ports = [ "${toString cfg.port}:1066" ];
      volumes = [ "${cfg.nfs}${cfg.name}_config:/app/appdata/DataBase" ];
      environment = {
        TZ = "Asia/Shanghai";
      };
      extraOptions = [ "--network=proxy" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "e5";
    port = mkOpt' int 1066;
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
