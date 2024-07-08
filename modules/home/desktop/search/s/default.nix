{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "s";
    confs = {
      "fish/completions" = ./s.fish;
    };
  }
)
