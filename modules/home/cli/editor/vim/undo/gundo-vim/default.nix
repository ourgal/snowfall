args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ gundo ]; # broken require python 2
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
