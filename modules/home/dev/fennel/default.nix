{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "antifennel";
    nixPkgs = [
      "fennel"
      "parinfer-rust-emacs"
      "fennel-ls"
      "fnlfmt"
    ];
  }
)
