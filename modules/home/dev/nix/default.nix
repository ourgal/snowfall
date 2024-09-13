{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    servs = "lorri";
    nixPkgs = [
      # keep-sorted start
      "nil"
      "nix-init"
      "nixd"
      "nixfmt-rfc-style"
      "statix"
      "update-nix-fetchgit"
      # keep-sorted end
    ];
  }
)
