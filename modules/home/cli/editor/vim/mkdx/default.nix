{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ mkdx ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)