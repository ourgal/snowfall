{
  myPkgs = [
    # keep-sorted start
    "html-to-markdown"
    "mdtt"
    "pangu.py"
    "pmark"
    "textpod"
    # keep-sorted end
  ];
  pyPkgs = "grip";
  nixPkgs = [
    # keep-sorted start
    "autocorrect"
    "cbfmt"
    "doctoc"
    "lowdown"
    "markdown-oxide"
    "marksman"
    "md-lsp"
    "md-tangle"
    "mdbook"
    "mdq"
    "mdsh"
    "mdwatch"
    "mmdoc"
    "mpls"
    "prettier"
    "proselint"
    "textlint"
    "vale"
    "vale-ls"
    "vault-tasks"
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
