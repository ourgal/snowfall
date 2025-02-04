args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        lib
        namespace
        cfgHome
        mkOpt'
        ;
      cfg = cfgHome config.${namespace} ./.;
      styleOpt = lib.types.enum [
        "minimal"
        "fancy"
        "jetpack"
      ];
    in
    {
      path = ./.;
      progs.starship.settings =
        if (cfg.style == "fancy") then
          lib.importTOML ./fancy.toml
        else if (cfg.style == "minimal") then
          lib.importTOML ./minimal.toml
        else if (cfg.style == "jetpack") then
          lib.importTOML ./jetpack.toml
        else
          { };
      extraOpts = {
        style = mkOpt' styleOpt "jetpack";
      };
    }
  )
)
