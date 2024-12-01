args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "tectonic"
      "tex-fmt"
      "texlab"
      "texliveFull"
      # keep-sorted end
    ];
  }
)
