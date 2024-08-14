{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "dive"
      "docker-compose"
      "lazydocker"
      "oxker"
      # keep-sorted end
    ];
  }
)
