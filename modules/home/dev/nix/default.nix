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
      "niv"
      "nixd"
      "nixfmt-rfc-style"
      "nixpkgs-lint-community"
      "npins"
      "patsh"
      "prefetch-npm-deps"
      "statix"
      "update-nix-fetchgit"
      # keep-sorted end
    ];
    enable = "nix-init";
  }
)
