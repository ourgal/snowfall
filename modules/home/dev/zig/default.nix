{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "zig"
      "zls"
    ];
  }
)
