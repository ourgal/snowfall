{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "hexabyte"
      "hexpatch"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "heh"
      "hexyl"
      # keep-sorted end
    ];
  }
)
