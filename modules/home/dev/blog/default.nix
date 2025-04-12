args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "eleventy";
    nixPkgs = [
      # keep-sorted start
      "antora"
      "hugo"
      "jekyll"
      # keep-sorted end
    ];
  }
)
