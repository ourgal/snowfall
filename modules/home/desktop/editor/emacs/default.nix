{
  nixPkgs = [
    # keep-sorted start
    "emacs-lsp-booster"
    "gnuplot"
    # keep-sorted end
  ];
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.vterm ];
  };
  servs = "emacs";
  sessionPath = [ "$HOME/.config/emacs/bin" ]; # doomemacs
  enable = [
    # keep-sorted start
    "apheleia"
    "better-defaults"
    "cape"
    "catppuccin"
    "corfu"
    "dirvish"
    "editorconfig"
    "eglot-booster"
    "eldoc-box"
    "evil"
    "fzf"
    "helpful"
    "keybindings"
    "ligature"
    "nix-mode"
    "orderless"
    "persp-mode"
    "rainbow-delimiters"
    "super-save"
    "telega"
    "which-key"
    # keep-sorted end
  ];
}
