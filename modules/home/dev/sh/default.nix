{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "shfmt"
      "shellcheck"
    ];
    nodePkgs = "bash-language-server";
  }
)
