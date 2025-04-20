args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.vim = {
        plugins = with pkgs.${namespace}; [ vim-cycle ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
