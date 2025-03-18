args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProj
    dockerOpts
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value =
    (arionProj {
      inherit cfg;
      image = "sigoden/dufs";
      config = "/data";
      cmd = [
        "/data"
        "-A"
      ];
      containerPorts = ports;
    })
    // {
      ${namespace}.user.ports = [ cfg.ports ];
    };
  name = "dufs";
  ports = 5000;
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
