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
      image = "henryclw/jsonhero-web";
      containerPorts = ports;
    })
    // {
      ${namespace} = {
        user.ports = [ cfg.ports ];
        firehol.services = [
          {
            inherit name;
            tcp = cfg.ports;
          }
        ];
      };
    };
  name = "jsonhero";
  ports = 8787;
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
