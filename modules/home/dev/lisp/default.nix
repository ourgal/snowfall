{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "parinfer-rust-emacs"
      "sbcl"
    ];
  }
)
