args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "metals"
      "scala"
      "scala-cli"
      "scalafix"
      "scalafmt"
      # keep-sorted end
    ];
  }
)
