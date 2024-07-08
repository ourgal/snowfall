{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule cfgNixos mkOpt';
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/linuxserver/syncthing:${cfg.version}";
      ports = [
        "0.0.0.0:${toString cfg.port}:8384"
        "0.0.0.0:22000:22000/tcp"
        "0.0.0.0:22000:22000/udp"
        "0.0.0.0:21027:21027/udp"
      ];
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
    port = mkOpt' int 8384;
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
