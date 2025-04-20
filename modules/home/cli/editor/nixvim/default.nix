args:
args.module (
  args
  // (
    let
      inherit (args) namespace enabled pkgs;
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
          nixvim = {
            extraLuaPackages = ps: [ ps.magick ];

            globals.mapleader = " ";

            autoCmd = [
              {
                event = [ "TextYankPost" ];
                pattern = [ "*" ];
                command = "silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=200}";
              }
            ];

            highlight = {
              Comment = {
                fg = "#ff00ff";
                bg = "#000000";
                underline = true;
                bold = true;
              };
            };

            extraFiles = {
              "ftplugin/help.lua".source = ./help.lua;
              "ftplugin/git.lua".source = ./git.lua;
            };

            extraConfigLua = builtins.readFile ./extraConfig.lua;

            extraPlugins = with pkgs.vimPlugins; [
              clipboard-image-nvim
              friendly-snippets # Should load this in at LuaSnip's initialisation, no clue how tho yet...
              glow-nvim # Glow inside of Neovim
              nvim-web-devicons # Should load this in at Telescope/Neotree actions.
              ultisnips
              vim-be-good
            ];
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
      enable = [
        # keep-sorted start
        "alpha-nvim"
        "auto-save-nvim"
        "auto-session"
        "blink-cmp"
        "bufferline-nvim"
        "conform-nvim"
        "fugitive"
        "gitsigns-nvim"
        "keymaps"
        "lsp"
        "lualine-nvim"
        "luasnip"
        "mini-nvim"
        "noice-nvim"
        "nvim-autopairs"
        "nvim-lint"
        "nvim-notify"
        "nvim-treesitter"
        "nvim-trouble"
        "nvim-ts-autotag"
        "settings"
        "telescope-nvim"
        "vim-dirvish"
        "vim-floaterm"
        "web-devicons"
        "which-key-nvim"
        # keep-sorted end
      ];
      value = {
        ${namespace} = {
          cli.utils.alias.aliae.alias = {
            vu = "lvim";
          };
          dev.python.global.pkgs = p: [ p.pynvim ];
          cli.editor.nixvim = {
            colorschemes.tokyonight = enabled;
          };
        };
      };
    }
  )
)
