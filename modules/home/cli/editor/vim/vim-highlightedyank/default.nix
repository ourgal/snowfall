{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vim-highlightedyank ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
