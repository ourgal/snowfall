{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "faq"
      # keep-sorted end
    ];
  }
)
