args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ vim-polyglot ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
