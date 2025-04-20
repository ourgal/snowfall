{
  path = ./.;
  myPkgs = "batwhich";
  nixPkgs = [
    # keep-sorted start
    "as-tree"
    "gat"
    # keep-sorted end
  ];
  enable = "bat";
}
