args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "convfmt"
      "otree"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "dasel"
      "faq"
      "remarshal"
      "taplo"
      # keep-sorted end
    ];
  }
)
