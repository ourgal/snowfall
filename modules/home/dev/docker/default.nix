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
      "dockerfile-language-server-nodejs"
      "dockfmt"
      "lazydocker"
      "oxker"
      "podman"
      "podman-compose"
      # keep-sorted end
    ];
  }
)
