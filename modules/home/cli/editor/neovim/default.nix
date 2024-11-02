args:
args.module (
  args
  // (
    let
      inherit (args) namespace;
    in
    {
      path = ./.;
      nixPkgs = [
        "fd"
        "ripgrep"
        "tree-sitter"
        "ueberzugpp"
      ];
      nodePkgs = "neovim";
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
              vu = "lvim";
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
      value = {
        ${namespace}.dev.python.global.pkgs = (p: [ p.pynvim ]);
      };
    }
  )
)
