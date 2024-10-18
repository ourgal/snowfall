{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vim-qf ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
