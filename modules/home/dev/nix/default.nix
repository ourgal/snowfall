{
  servs = "lorri";
  nixPkgs = [
    # keep-sorted start
    "deadnix"
    "nil"
    "nixfmt"
    "prefetch-npm-deps"
    "statix"
    "update-nix-fetchgit"
    # keep-sorted end
  ];
  enable = "nix-init";
}
