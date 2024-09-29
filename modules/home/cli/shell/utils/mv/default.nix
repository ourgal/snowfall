{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    perlPkgs = "vidir";
    nixPkgs = [
      # keep-sorted start
      "mmv-go"
      # keep-sorted end
    ];
  }
)
