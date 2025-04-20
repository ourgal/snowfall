args:
args.module (
  args
  // (
    let
      inherit (args) namespace;
    in
    {
      nixPkgs = [
        # keep-sorted start
        "fd"
        "neovim-node-client"
        "ripgrep"
        "tree-sitter"
        "ueberzugpp"
        # keep-sorted end
      ];
      progs = [
        {
          neovim = {
            extraLuaPackages = ps: [ ps.magick ];
            catppuccin.enable = false;
          };
        }
        {
          fish = {
            shellAbbrs.vu = "lvim";
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
        ${namespace} = {
          cli.utils.alias.aliae.alias = {
            vu = "lvim";
          };
          dev.python.global.pkgs = (p: [ p.pynvim ]);
        };
      };
    }
  )
)
