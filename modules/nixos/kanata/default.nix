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
    enabled
    mkOpt'
    cfgNixos
    getDirname
    mkFireholRule
    ;
  cfg = cfgNixos config.${namespace} ./.;
  name = getDirname _name;
  value = {
    services.kanata = enabled // {
      keyboards.default = {
        config = ''
          (defsrc)

          (deflayer base)

          (deflayermap (firefox_layer)
            x C-w
            z C-S-t
            c C-S-tab
            v C-tab)
        '';
        inherit (cfg) port;
      };
    };
    networking.firewall.allowedTCPPorts = [ cfg.port ];
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = cfg.port;
    };
  };
  extraOpts = {
    port = mkOpt' lib.types.port 16666;
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
