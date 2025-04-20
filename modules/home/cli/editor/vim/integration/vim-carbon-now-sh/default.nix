args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ vim-carbon-now-sh ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
