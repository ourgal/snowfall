args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "bafi"
      "convfmt"
      "otree"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "dasel"
      "dyff"
      "faq"
      "remarshal"
      "yaml-language-server"
      "yamlfmt"
      # keep-sorted end
    ];
  }
)
