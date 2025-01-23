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
        plugins = with pkgs.vimPlugins; [ vim-mundo ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
