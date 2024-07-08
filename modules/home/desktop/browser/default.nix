{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "brave"
      "firefox"
    ];
    enable = [
      "chromium"
      "librewolf"
      "qutebrowser"
    ];
  }
)
