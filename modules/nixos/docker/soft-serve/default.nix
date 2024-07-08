{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule cfgNixos mkOpt';
  cfg = cfgNixos config.${namespace} ./.;
  sshKeys = config.${namespace}.user.sshKeys.home;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/charmcli/soft-serve:${cfg.version}";
      ports = [
        "${toString cfg.port1}:23231"
        "${toString cfg.port}:23232"
        "${toString cfg.port2}:23233"
        "${toString cfg.port3}:9418"
      ];
      environment = {
        SOFT_SERVE_INITIAL_ADMIN_KEYS = sshKeys;
      };
      volumes = [ "${cfg.nfs}${cfg.name}_config:/soft-serve" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "soft-serve";
    port = mkOpt' int 23232;
    port1 = mkOpt' int 23231;
    port2 = mkOpt' int 23233;
    port3 = mkOpt' int 9418;
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
