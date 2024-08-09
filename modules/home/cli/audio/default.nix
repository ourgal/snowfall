{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      "sonicradio"
      "roc-switch"
    ];
    nixPkgs = [
      "id3v2"
      "pulsemixer"
    ];
    enable = [
      "cava"
      "mpd"
      "pipewire"
      "pyradio"
    ];
  }
)
