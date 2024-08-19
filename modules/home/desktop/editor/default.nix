{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "neovide"
      "zed-editor"
      # keep-sorted end
    ];
    enable = "emacs";
  }
)
