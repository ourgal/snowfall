args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "config-file-validator"
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
      "tomlq"
      # keep-sorted end
    ];
  }
)
