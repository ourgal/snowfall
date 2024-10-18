{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [ vimtex ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
