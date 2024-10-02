{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "otree";
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
