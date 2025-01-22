args:
args.module (
  args
  // (
    let
      inherit (args) config namespace;
    in
    {
      path = ./.;
      progs.vim.extraConfig =
        (builtins.readFile ./option.vim)
        + (builtins.readFile ./keymap.vim)
        + (
          if config.${namespace}.cli.editor.vim.is-vim.enable then
            ""
          else
            ''
              nnoremap n nzzzv
              nnoremap N Nzzzv
            ''
        );
      enable = [
        # keep-sorted start
        "ale"
        "align"
        "bufexplorer"
        "catppuccin-vim"
        "caw-vim"
        "chezmoi-vim"
        "coc-nvim"
        "ctrlp-vim"
        "devdocs-vim"
        "dps-ghosttext-vim"
        "easyjump-vim"
        "editorconfig-vim"
        "ferret"
        "fzf-vim"
        "git-lens-vim"
        "git-messager-vim"
        "gtm-vim-plugin"
        "gv-vim"
        "indentLine"
        "is-vim"
        "lexima-vim"
        "lightline-vim"
        "meson"
        "mkdx"
        "mru"
        "pangu-vim"
        "parinfer-rust"
        "rainbow"
        "skim"
        "targets-vim"
        "undotree"
        "vim-auto-save"
        "vim-carbon-now-sh"
        "vim-dispatch"
        "vim-easy-align"
        "vim-exchange"
        "vim-floaterm"
        "vim-fugitive"
        "vim-gitgutter"
        "vim-github-link"
        "vim-grepper"
        "vim-highlightedyank"
        "vim-latex-live-preview"
        "vim-ledger"
        "vim-matchup"
        "vim-mkdir"
        "vim-polyglot"
        "vim-qf"
        "vim-repeat"
        "vim-rhubarb"
        "vim-silicon"
        "vim-sneak"
        "vim-snippets"
        "vim-subversive"
        "vim-surround"
        "vim-templates"
        "vim-tome"
        "vim-toop"
        "vim-unimpaired"
        "vim-visual-star-search"
        "vim-which-key"
        "vim-workspace"
        "vim-zoom"
        "vimsuggest"
        "vimux"
        "vis"
        "visual-split-vim"
        "vlime"
        "wiki-vim"
        "zeavim-vim"
        "zoxide-vim"
        # keep-sorted end
      ];
      dataFiles = {
        "vim/.keep" = "";
      };
    }
  )
)
