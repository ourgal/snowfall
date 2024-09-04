{ ... }@args:
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
      # keep-sorted end
    ];
    progs = {
      fish = {
        shellAbbrs = {
          ad = "lazydocker";
        };
      };
    };
  }
)
