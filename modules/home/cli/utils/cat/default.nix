args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "batwhich";
    batPkgs = [
      # keep-sorted start
      "batdiff"
      "batgrep"
      "batman"
      "batpipe"
      "batwatch"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "as-tree"
      "bat"
      "gat"
      # keep-sorted end
    ];
  }
)
