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
      image = "lancommander/lancommander";
      config = "/config";
      env = {
        TZ = "Asia/Shanghai";
        PUID = "1000";
        PGID = "1000";
      };
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
  name = "lancommander";
  ports = [
    1337
    35891
  ];
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
