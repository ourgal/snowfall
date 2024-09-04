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
    progs = [
      {
        neovim = {
          extraLuaPackages = ps: [ ps.magick ];
          catppuccin.enable = false;
        };
      }
      {
        fish = {
          shellAbbrs = {
            v = "lvim";
          };
          functions = {
            vn = {
              body = # fish
                ''
                  set -x NVIM_APPNAME nvchad
                  nvim $argv
                '';
              description = "nvchad";
            };
            vl = {
              body = # fish
                ''
                  set -x NVIM_APPNAME lazyvim
                  nvim $argv
                '';
              description = "lazyvim";
            };
            va = {
              body = # fish
                ''
                  set -x NVIM_APPNAME astrovim
                  nvim $argv
                '';
              description = "astrovim";
            };
          };
        };
      }
    ];
  }
)
