{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "ttdl";
    confs = {
      "ttdl" = ./ttdl.toml;
    };
  }
)
