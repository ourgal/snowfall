{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "typst"
      "typst-live"
      "typst-lsp"
      "typst-preview"
      "typstfmt"
    ];
  }
)
