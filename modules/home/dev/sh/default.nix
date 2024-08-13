{ ... }@args:
args.module (
  args
  // {
    path = ./.;
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
