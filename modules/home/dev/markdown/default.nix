{
  myPkgs = [
    # keep-sorted start
    "html-to-markdown"
    "mdtt"
    "pmark"
    "textpod"
    "zhlint"
    # keep-sorted end
  ];
  nodePkgs = "prettier";
  pyPkgs = "grip";
  nixPkgs = [
    # keep-sorted start
    "autocorrect"
    "cbfmt"
    "doctoc"
    "lowdown"
    "marksman"
    "md-tangle"
    "mdbook"
    "mdsh"
    "mmdoc"
    "proselint"
    "vale"
    "vale-ls"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "mdformat"
    "mdsf"
    "zk"
    # keep-sorted end
  ];
}
