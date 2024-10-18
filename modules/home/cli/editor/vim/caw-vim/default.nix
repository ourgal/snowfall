args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ caw-vim ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
