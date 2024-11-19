args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "html-to-markdown"
      "mdtt"
      "pmark"
      "textpod"
      # keep-sorted end
    ];
    nodePkgs = "prettier";
    nixPkgs = [
      # keep-sorted start
      "autocorrect"
      "cbfmt"
      "lowdown"
      "marksman"
      "md-tangle"
      "mdbook"
      "mdsh"
      "mmdoc"
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
)
