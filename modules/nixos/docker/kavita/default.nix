{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    arionProj
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value =
    with cfg;
    arionProj {
      inherit
        name
        version
        ports
        nfs
        nfsPath
        ;
      image = "linuxserver/kavita";
      config = "/config";
      nativeVolumes = [
        "${mount}/books:/books:ro"
        "${mount}/wenku:/wenku:ro"
      ];
      containerPorts = 5000;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "kavita";
    ports = mkOpt' port 5000;
    nfs = mkOpt' str "";
    nfsPath = mkOpt' str "/docker";
    mount = mkOpt' str "";
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
