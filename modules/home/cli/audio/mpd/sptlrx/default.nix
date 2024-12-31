args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "sptlrx";
    confs."sptlrx/config.yaml" = {
      player = "mpd";
    };
  }
)
