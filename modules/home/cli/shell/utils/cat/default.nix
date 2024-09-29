{ ... }@args:
args.module (
  args
  // {
    path = ./.;
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
      "bat"
      # keep-sorted end
    ];
  }
)
