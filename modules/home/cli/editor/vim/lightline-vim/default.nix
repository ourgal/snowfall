{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ lightline-vim ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
