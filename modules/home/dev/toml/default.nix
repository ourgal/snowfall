{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "otree";
    nixPkgs = [
      # keep-sorted start
      "faq"
      "remarshal"
      "taplo"
      # keep-sorted end
    ];
  }
)
