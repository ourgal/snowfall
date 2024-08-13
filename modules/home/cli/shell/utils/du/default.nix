{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "diskus"
      "du-dust"
      "dua"
      "duc"
      "gdu"
      # keep-sorted end
    ];
  }
)
