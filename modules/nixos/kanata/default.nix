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
        config =
          ''
            (defsrc)

            (deflayer base)
          ''
          + (
            let
              name = "calibre";
            in
            ''
              (deflayermap (${name}_layer)
                j down
                k up
                l right
                h left
                y C-c
                f C-f
                p C-v
                i (layer-switch ${name}_input_layer))

              (deflayermap (${name}_input_layer)
                esc (layer-switch ${name}_layer))
            ''
          );
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
