{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "hck"
      # keep-sorted end
    ];
  }
)
