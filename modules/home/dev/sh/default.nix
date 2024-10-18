{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "makedown"
      "pnut"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "jc"
      "shellcheck"
      "shfmt"
      "zx"
      # keep-sorted end
    ];
    nodePkgs = "bash-language-server";
  }
)
