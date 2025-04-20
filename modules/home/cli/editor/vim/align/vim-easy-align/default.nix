args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ vim-easy-align ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
