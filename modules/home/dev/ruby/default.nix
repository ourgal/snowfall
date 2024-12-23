args:
args.module (
  args
  // {
    path = ./.;
    rubyPkgs = "solargraph";
    nixPkgs = [
      # keep-sorted start
      "ruby"
      "ruby-lsp"
      "rubyfmt"
      # keep-sorted end
    ];
  }
)
