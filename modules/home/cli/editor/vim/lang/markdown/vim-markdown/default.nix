args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ vim-markdown ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
