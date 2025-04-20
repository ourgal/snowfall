{
  path = ./.;
  myPkgs = "antifennel";
  nixPkgs = [
    # keep-sorted start
    "fennel"
    "fennel-ls"
    "fnlfmt"
    "parinfer-rust-emacs"
    # keep-sorted end
  ];
}
