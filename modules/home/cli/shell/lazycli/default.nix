{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "lazycli";
    confs = {
      lazycli = ./config.yml;
    };
  }
)
