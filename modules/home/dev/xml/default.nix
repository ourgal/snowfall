args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "bafi";
    nixPkgs = [
      # keep-sorted start
      "dasel"
      "faq"
      # keep-sorted end
    ];
  }
)
