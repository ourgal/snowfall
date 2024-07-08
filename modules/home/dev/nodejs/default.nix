{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "nodejs"
      "yarn"
    ];
    nodePkgs = "pnpm";
    files = [
      {
        ".npmrc" = ''
          registry = https://registry.npmmirror.com
          coc.nvim:registry=https://registry.npmmirror.com/'';
      }
      { ".local/share/pnpm/.keep" = ""; }
    ];
    progs = {
      fish = {
        shellInit = ''
          set -x PNPM_HOME "$HOME/.local/share/pnpm"
          fish_add_path ~/.local/share/pnpm
        '';
      };
    };
  }
)
