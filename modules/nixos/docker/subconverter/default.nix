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
      image = "asdlokj1qpi23/subconverter";
      config = "/base";
      env = {
        TZ = "Asia/Shanghai";
      };
      containerPorts = ports;
    })
    // {
      ${namespace}.user.ports = [ cfg.ports ];
    };
  name = "subconverter";
  ports = 25500;
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
