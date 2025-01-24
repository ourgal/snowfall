args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "chezmoi-vim"
      "devdocs-vim"
      "dps-ghosttext-vim"
      "gtm-vim-plugin"
      "meson"
      "vim-carbon-now-sh"
      "vim-dispatch"
      "vim-floaterm"
      "vim-silicon"
      "vim-tmux-clipboard"
      "vim-tome" # tmux playbook
      "vimux" # tmux
      "zeavim-vim"
      "zoxide-vim"
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "editorconfig-vim"
      "emodeline" # emacs
      "hurl"
      "kmonad-vim"
      "tup"
      "vim-ghost" # broken
      "vim-ledger"
      # keep-sorted end
    ];
  }
)
