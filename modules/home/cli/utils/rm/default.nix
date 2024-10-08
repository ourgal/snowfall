{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gomi"
      "rm-improved"
      "trash-cli"
      # keep-sorted end
    ];
  }
)
