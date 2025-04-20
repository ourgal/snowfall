args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ taboo-vim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
