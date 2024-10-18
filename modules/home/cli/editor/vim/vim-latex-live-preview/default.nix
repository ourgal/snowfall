{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vim-latex-live-preview ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
