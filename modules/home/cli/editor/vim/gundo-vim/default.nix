args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ gundo ]; # broken require python 2
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
