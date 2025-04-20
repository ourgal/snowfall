args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ undotree ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
