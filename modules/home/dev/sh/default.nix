args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "pnut"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "argbash"
      "bashly"
      "jc"
      "shellcheck"
      "shfmt"
      "usage"
      "zx"
      # keep-sorted end
    ];
    nodePkgs = "bash-language-server";
  }
)
