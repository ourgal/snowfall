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
        plugins = with pkgs.${namespace}; [ vim-templates ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
