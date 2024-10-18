args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "tectonic"
      "texlab"
      "texliveFull"
      # keep-sorted end
    ];
  }
)
