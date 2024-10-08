{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    perlPkgs = "vidir";
    nixPkgs = [
      # keep-sorted start
      "edir"
      "mmv-go"
      # keep-sorted end
    ];
  }
)
