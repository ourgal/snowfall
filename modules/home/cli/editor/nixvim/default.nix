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

        extraConfigLua = builtins.readFile ./extraConfig.lua;

        extraPlugins = with args.pkgs.vimPlugins; [
          clipboard-image-nvim
          friendly-snippets # Should load this in at LuaSnip's initialisation, no clue how tho yet...
          glow-nvim # Glow inside of Neovim
          nvim-web-devicons # Should load this in at Telescope/Neotree actions.
          ultisnips
          vim-be-good
        ];
      };
    };
    enable = [
      "alpha-nvim"
      "auto-save-nvim"
      "auto-session"
      "bufferline-nvim"
      "conform-nvim"
      "gitsigns-nvim"
      "keymaps"
      "lsp"
      "lualine-nvim"
      "luasnip"
      "mini-nvim"
      "noice-nvim"
      "nvim-autopairs"
      "nvim-cmp"
      "nvim-lint"
      "nvim-notify"
      "nvim-treesitter"
      "nvim-trouble"
      "nvim-ts-autotag"
      "settings"
      "telescope-nvim"
      "vim-floaterm"
      "which-key-nvim"
    ];
    value = with args; {
      ${namespace}.cli.editor.nixvim = {
        colorschemes.tokyonight = enabled;
      };
    };
  }
)
