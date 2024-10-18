args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vim-sneak ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
