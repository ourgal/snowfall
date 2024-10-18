args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs.vim = {
        plugins = with pkgs.${namespace}; [ vim-cycle ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
