{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "pnut";
    nixPkgs = [
      # keep-sorted start
      "jc"
      "shellcheck"
      "shfmt"
      # keep-sorted end
    ];
    nodePkgs = "bash-language-server";
  }
)
