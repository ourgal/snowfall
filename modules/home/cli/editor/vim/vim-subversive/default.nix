args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vim-subversive ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
