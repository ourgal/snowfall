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
      "vscode"
      # keep-sorted end
    ];
  }
)
