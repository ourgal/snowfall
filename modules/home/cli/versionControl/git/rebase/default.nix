{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-interactive-rebase-tool"
      # keep-sorted end
    ];
  }
)
