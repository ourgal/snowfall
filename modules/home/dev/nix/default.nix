args:
args.module (
  args
  // {
    path = ./.;
    servs = "lorri";
    nixPkgs = [
      # keep-sorted start
      "deadnix"
      "nil"
      "nixd"
      "nixfmt-rfc-style"
      "prefetch-npm-deps"
      "statix"
      "update-nix-fetchgit"
      # keep-sorted end
    ];
    enable = "nix-init";
  }
)
