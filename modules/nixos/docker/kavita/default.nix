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
      image = "linuxserver/kavita";
      config = "/config";
      nativeVolumes = [
        "${cfg.mount}/books:/books:ro"
        "${cfg.mount}/wenku:/wenku:ro"
      ];
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
  name = "kavita";
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
