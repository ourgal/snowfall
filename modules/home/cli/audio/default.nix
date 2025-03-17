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
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "espeak"
      "id3v2"
      "lame"
      "normalize"
      "openai-whisper-cpp"
      "pamixer"
      "pulsemixer"
      "scope-tui"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "beets"
      "cava"
      "mpd"
      "pipewire"
      "pyradio"
      "termsonic"
      # keep-sorted end
    ];
  }
)
