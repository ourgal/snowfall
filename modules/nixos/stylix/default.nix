args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    cfgNixos
    mkOpt'
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    stylix = enabled // {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.theme}.yaml";
    };
  };
  extraOpts = {
    theme = mkOpt' lib.types.string "tokyo-night-dark";
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
