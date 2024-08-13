{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "carbon-now-cli"
      "silicon"
      # keep-sorted end
    ];
  }
)
