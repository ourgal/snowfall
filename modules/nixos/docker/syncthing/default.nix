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
      image = "linuxserver/syncthing";
      config = "/config";
      volumes = "sync:/sync";
      hostname = config.dot.user.host;
      containerPorts = [
        8384
        22000
        21027
      ];
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "syncthing";
    ports = mkOpt' (either port (listOf port)) [
      8384
      22000
      21027
    ];
    nfs = mkOpt' str "";
    nfsPath = mkOpt' str "/docker";
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
