{ ... }@args:
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
        tomlFile
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
      progs = {
        starship = {
          settings =
            if (cfg.style == "fancy") then
              tomlFile ./fancy.toml
            else if (cfg.style == "minimal") then
              tomlFile ./minimal.toml
            else if (cfg.style == "jetpack") then
              tomlFile ./jetpack.toml
            else
              { };
        };
      };
      extraOpts = {
        style = mkOpt' styleOpt "jetpack";
      };
    }
  )
)
