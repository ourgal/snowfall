args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ lightline-vim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
