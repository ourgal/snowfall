{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "sonicradio";
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
