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
      # keep-sorted end
    ];
    enable = "texlive";
  }
)
