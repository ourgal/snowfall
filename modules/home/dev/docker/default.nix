{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "dive"
      "lazydocker"
      "docker-compose"
    ];
  }
)
