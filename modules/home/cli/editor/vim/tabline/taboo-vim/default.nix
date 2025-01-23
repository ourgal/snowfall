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
        plugins = with pkgs.vimPlugins; [ taboo-vim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
