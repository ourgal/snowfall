{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "choose"
      "hck"
      # keep-sorted end
    ];
  }
)
