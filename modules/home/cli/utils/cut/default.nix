args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = "percol";
    nixPkgs = [
      # keep-sorted start
      "choose"
      "hck"
      # keep-sorted end
    ];
  }
)
