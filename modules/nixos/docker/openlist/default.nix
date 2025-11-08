args:
let
  inherit (args)
    namespace
    lib
    config
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProj
    dockerOpts
    getDirname
    mkFireholRule
    mkSystemUser
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value =
    (arionProj {
      inherit cfg;
      inherit (lib.${namespace}.sources."docker-${name}") src;
      user = name;
      nativeVolumes = [ "/var/lib/${name}:/opt/openlist/data" ];
      env = {
        UMASK = "022";
      };
      containerPorts = ports;
    })
    // {
      ${namespace} = mkFireholRule {
        inherit name;
        tcp = cfg.ports;
      };
    }
    // mkSystemUser name;
  name = getDirname _name;
  ports = 5244;
  extraOpts = dockerOpts { inherit name ports; };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
