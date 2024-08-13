{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "faq"
      "yaml-language-server"
      "yamlfmt"
      # keep-sorted end
    ];
  }
)
