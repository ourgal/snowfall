{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "hexabyte";
    nixPkgs = [
      # keep-sorted start
      "heh"
      "hexyl"
      # keep-sorted end
    ];
  }
)
