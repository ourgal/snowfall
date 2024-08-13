{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "heh"
      "hexyl"
      # keep-sorted end
    ];
  }
)
