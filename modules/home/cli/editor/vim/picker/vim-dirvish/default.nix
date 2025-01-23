args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs.vim = {
        plugins = [
          pkgs.vimPlugins.vim-dirvish
          pkgs.${namespace}.vim-dirvish-dovish
        ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
