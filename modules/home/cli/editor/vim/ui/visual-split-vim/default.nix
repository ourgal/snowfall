args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.vim = {
        plugins = with pkgs.${namespace}; [ visual-split-vim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
