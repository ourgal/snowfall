args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      nixPkgs = "perlnavigator";
      perlPkgs = "Appcpanminus";
      files = {
        ".perlcriticrc" = ''[-Subroutines::ProhibitSubroutinePrototypes]'';
        ".perltidyrc" = ''
          -i=${toString config.editorconfig.settings."*".indent_size}
        '';
      };
      enable = "global";
    }
  )
)
