args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ gv-vim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
