args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "compose2nix";
    nixPkgs = [
      # keep-sorted start
      "dive"
      "docker-compose"
      "lazydocker"
      "oxker"
      "podman"
      "podman-compose"
      # keep-sorted end
    ];
  }
)
