{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "otree";
    nixPkgs = [
      # keep-sorted start
      "faq"
      "taplo"
      # keep-sorted end
    ];
  }
)
