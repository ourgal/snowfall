args:
args.module (
  args
  // (
    let
      inherit (args) config lib;
    in
    {
      nixPkgs = [
        # keep-sorted start
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
        "corfu"
        "dirvish"
        "editorconfig"
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
      ]
      ++ lib.optional config.catppuccin.enable "catppuccin";
    }
  )
)
