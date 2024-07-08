{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "nil"
      "nix-init"
      "nixfmt-rfc-style"
      "statix"
      "update-nix-fetchgit"
    ];
  }
)
