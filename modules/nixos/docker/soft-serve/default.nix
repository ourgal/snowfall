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
  sshKeys = config.${namespace}.user.sshKeys.home;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/charmcli/soft-serve:${cfg.version}";
      ports = dockerPots cfg.port;
      environment = {
        SOFT_SERVE_INITIAL_ADMIN_KEYS = sshKeys;
      };
      volumes = [ "${cfg.nfs}${cfg.name}_config:/soft-serve" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "soft-serve";
    port = mkOpt' (either port (listOf port)) [
      23232
      23231
      23233
      9418
    ];
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
