{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "brave"
      "firefox"
      "floorp"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "chromium"
      "librewolf"
      "qutebrowser"
      # keep-sorted end
    ];
  }
)
