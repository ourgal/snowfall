{
  servs = "emacs";
  nixPkgs = [
    # keep-sorted start
    "emacs-lsp-booster"
    "gnuplot"
    # keep-sorted end
  ];
  progs.doom-emacs = {
    enable = true;
    doomDir = ./config;
    experimentalFetchTree = true; # Disable if there are fetcher issues
  };
  enable = [
    # keep-sorted start
    "adoc-mode"
    "alert"
    "annotate"
    "bing-dict"
    "catppuccin-theme"
    "chinese-conv"
    "chinese-number"
    "dotenv-mode"
    "eglot-booster"
    "fzf"
    "git-time-metric"
    "gt"
    "just-mode"
    "just-ts-mode"
    "magit-delta"
    "magit-stats"
    "magit-todos"
    "move-text"
    "nftables-mode"
    "notmuch"
    "nov"
    "pangu-spacing"
    "perltidy"
    "rainbow-delimiters"
    "super-save"
    "treesit-grammars"
    "vimscript-ts-mode"
    "zeal-at-point"
    "zoxide"
    # keep-sorted end
  ];
}
