args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "meson"
      "mesonlsp"
      "ninja"
      # keep-sorted end
    ];
  }
)
