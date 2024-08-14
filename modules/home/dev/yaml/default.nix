{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "otree";
    nixPkgs = [
      # keep-sorted start
      "faq"
      "yaml-language-server"
      "yamlfmt"
      # keep-sorted end
    ];
  }
)
