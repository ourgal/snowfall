args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ zeavim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
