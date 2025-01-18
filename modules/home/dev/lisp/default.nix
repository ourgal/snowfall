args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "lisp-format";
    nixPkgs = [
      # keep-sorted start
      "parinfer-rust-emacs"
      "sbcl"
      # keep-sorted end
    ];
  }
)
