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
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "ack"
      "ripgrep"
      "ripgrep-all"
      "sift"
      "sig"
      "srgn"
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
