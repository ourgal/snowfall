args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "grip-grab"
      "hypergrep"
      "kbgrep"
      "play"
      "sig"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "ripgrep"
      "ripgrep-all"
      "sift"
      "ugrep"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "ast-grep"
      "vgrep"
      # keep-sorted end
    ];
  }
)
