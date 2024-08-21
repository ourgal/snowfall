{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProj
    dockerOpts
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = arionProj {
    inherit cfg;
    image = "xhofe/alist-aria2";
    config = "/opt/alist/data";
    env = {
      PUID = "0";
      PGID = "0";
      UMASK = "022";
    };
    containerPorts = ports;
  };
  name = "alist";
  ports = 5244;
  extraOpts = dockerOpts { inherit name ports; };
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
