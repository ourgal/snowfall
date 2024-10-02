{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "eleventy";
    nixPkgs = [
      # keep-sorted start
      "antora"
      "hexo-cli"
      "hugo"
      "jekyll"
      # keep-sorted end
    ];
  }
)
