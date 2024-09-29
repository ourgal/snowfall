{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = "scmpuff";
    nixPkgs = [
      # keep-sorted start
      "bit"
      # keep-sorted end
    ];
  }
)
