{ ... }@args:
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
      "dyff"
      "faq"
      "remarshal"
      "yaml-language-server"
      "yamlfmt"
      # keep-sorted end
    ];
  }
)
