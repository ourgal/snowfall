{
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
