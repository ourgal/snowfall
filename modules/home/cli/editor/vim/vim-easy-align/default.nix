args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vim-easy-align ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
