{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "fd"
      "ripgrep"
      "tree-sitter"
      "ueberzugpp"
    ];
    nodePkgs = "neovim";
    pyPkgs = "pynvim";
    progs = {
      neovim = {
        extraLuaPackages = ps: [ ps.magick ];
        catppuccin.enable = false;
      };
    };
  }
)
