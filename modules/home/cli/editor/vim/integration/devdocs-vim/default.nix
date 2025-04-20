args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.vim = {
        plugins = with pkgs.${namespace}; [ devdocs-vim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
