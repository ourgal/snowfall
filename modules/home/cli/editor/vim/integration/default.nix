args:
args.module (
  args
  // (
    let
      inherit (args) target lib namespace;
      inherit (lib.${namespace}) isX86;
    in
    {
      enable = [
        # keep-sorted start
        "chezmoi-vim"
        "devdocs-vim"
        "meson"
        "vim-bracketed-paste"
        "vim-carbon-now-sh"
        "vim-dispatch"
        "vim-floaterm"
        "vim-silicon"
        "vim-tome" # tmux playbook
        "vimux" # tmux
        "zeavim-vim"
        "zoxide-vim"
        # keep-sorted end
      ]
      ++ isX86 target [ "gtm-vim-plugin" ];
      disable = [
        # keep-sorted start
        "dps-ghosttext-vim"
        "editorconfig-vim"
        "emodeline" # emacs
        "hurl"
        "kmonad-vim"
        "tup"
        "vim-ghost" # broken
        "vim-ledger"
        "vim-orgmode"
        "vim-tmux-clipboard"
        # keep-sorted end
      ];
    }
  )
)
