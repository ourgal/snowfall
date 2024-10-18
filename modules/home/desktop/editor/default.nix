args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "neovide";
    enable = [
      # keep-sorted start
      "emacs"
      "lite-xl"
      # keep-sorted end
    ];
  }
)
