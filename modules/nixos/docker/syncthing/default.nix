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
      image = "docker.io/linuxserver/syncthing:${cfg.version}";
      ports = dockerPots cfg.port;
      volumes = [
        "${cfg.nfs}${cfg.name}_config:/config"
        "${cfg.nfs}${cfg.name}_sync:/sync"
      ];
      hostname = config.dot.user.host;
      extraOptions = [ "--network=proxy" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "syncthing";
    port = mkOpt' (either port (listOf port)) [
      8384
      22000
      21027
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
