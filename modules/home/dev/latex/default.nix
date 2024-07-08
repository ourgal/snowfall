{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "tectonic"
      "texlab"
      "texliveFull"
    ];
  }
)
