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
        plugins = with pkgs.vimPlugins; [ quick-scope ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
