{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vim-polyglot ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
