args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "grip-grab"
      "hypergrep"
      "play"
      "sig"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "ripgrep"
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
