args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ bufexplorer ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
