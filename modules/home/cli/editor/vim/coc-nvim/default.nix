{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ coc-nvim ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
