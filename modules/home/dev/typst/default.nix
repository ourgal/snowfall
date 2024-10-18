args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "typst"
      "typst-live"
      "typst-lsp"
      "typst-preview"
      "typstfmt"
      # keep-sorted end
    ];
  }
)
