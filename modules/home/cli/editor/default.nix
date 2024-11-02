args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "v";
    nixPkgs = [
      # keep-sorted start
      "micro"
      "ox"
      "vim-full"
      "vimer"
      "vis"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "helix"
      "kakoune"
      "nixvim"
      # keep-sorted end
    ];
  }
)
