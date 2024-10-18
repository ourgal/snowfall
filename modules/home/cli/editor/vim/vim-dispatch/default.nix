{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vim-dispatch ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
