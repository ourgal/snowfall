{ ... }@args:
args.module (
  args
  // {
    path = ./.;
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
