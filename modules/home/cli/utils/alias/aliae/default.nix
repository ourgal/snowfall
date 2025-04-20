args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        lib
        mkOpt'
        cfgHome
        ;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      nixPkgs = "aliae";
      files.".aliae.yaml" = {
        "alias" = lib.${namespace}.mkAliaeAlias cfg.alias;
      };
      progs = {
        bash.bashrcExtra = ''
          eval "$(aliae init bash)"
        '';
        fish.interactiveShellInit = ''
          aliae init fish | source
        '';
        zsh.initExtra = ''
          eval "$(aliae init zsh)"
        '';
      };
      extraOpts = {
        alias = mkOpt' lib.types.attrs { };
      };
    }
  )
)
