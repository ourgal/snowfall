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
        plugins = with pkgs.vimPlugins; [ bufexplorer ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
