args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "code-radio-cli"
      "radio-go-go"
      "roc-switch"
      "sonicradio"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "id3v2"
      "pulsemixer"
      "scope-tui"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "cava"
      "mpd"
      "pipewire"
      "pyradio"
      # keep-sorted end
    ];
  }
)
