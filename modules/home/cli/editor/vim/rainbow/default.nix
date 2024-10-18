{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim.plugins = with args.pkgs.vimPlugins; [ rainbow ];
    extraConfig = builtins.readFile ./config.vim;
  }
)
