args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "brave"
      "firefox"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "chromium"
      "qutebrowser"
      # keep-sorted end
    ];
  }
)
