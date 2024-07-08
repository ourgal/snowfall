{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "serpl";
    confs = {
      serpl = ./config.toml;
    };
  }
)
