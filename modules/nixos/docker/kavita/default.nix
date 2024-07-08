{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule cfgNixos mkOpt';
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    virtualisation.oci-containers.containers.${cfg.name} = {
      image = "docker.io/linuxserver/kavita:${cfg.version}";
      ports = [ "0.0.0.0:${toString cfg.port}:5000" ];
      volumes = [
        "${cfg.nfs}${cfg.name}_config:/config"
        "${cfg.nfsRoot}books:/books:ro"
        "${cfg.nfsRoot}wenku8:/wenku8:ro"
      ];
      extraOptions = [ "--network=proxy" ];
    };
  };
  extraOpts = with lib.types; {
    name = mkOpt' str "kavita";
    port = mkOpt' int 5000;
    nfs = mkOpt' str "";
    nfsRoot = mkOpt' str "";
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
