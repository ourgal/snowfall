{ ... }@args:
args.module (
  args
  // {
    path = ./.;
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
