{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "rm-improved"
      "trash-cli"
      # keep-sorted end
    ];
  }
)
