{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "oneshot";
    confs = {
      oneshot = ./config.yaml;
    };
  }
)
