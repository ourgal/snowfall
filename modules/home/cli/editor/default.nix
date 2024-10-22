args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "ox"
      "vim-full"
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
