{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "asciinema"
      "ttygif"
      "vhs"
      # keep-sorted end
    ];
  }
)
