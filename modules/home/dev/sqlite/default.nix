{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "gobang"
      "litecli"
    ];
  }
)
