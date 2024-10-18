{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs.vim = {
        plugins = with pkgs.${namespace}; [ vim-github-link ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
