args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "mplayer"
      "pyradio"
    ];
    confs = {
      pyradio = [
        ./config
        ./stations.csv
      ];
    };
  }
)
