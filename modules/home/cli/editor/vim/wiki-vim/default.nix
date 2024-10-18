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
        plugins = with pkgs.vimPlugins; [ wiki-vim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
