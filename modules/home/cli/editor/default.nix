args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "micro"
      "ox"
      "vim-full"
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
