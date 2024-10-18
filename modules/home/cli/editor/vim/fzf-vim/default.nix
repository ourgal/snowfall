{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ fzf-vim ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
