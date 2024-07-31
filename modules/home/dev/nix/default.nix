{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    servs = "lorri";
    nixPkgs = [
      "nil"
      "nix-init"
      "nixfmt-rfc-style"
      "statix"
      "update-nix-fetchgit"
    ];
  }
)
