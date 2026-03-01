{
  nixPkgs = [
    # keep-sorted start
    "brave"
    "firefox"
    # keep-sorted end
  ];
  myPkgs = "helix-ghost";
  enable = [
    # keep-sorted start
    "chromium"
    "extensions"
    "qutebrowser"
    "vieb"
    "zen-browser"
    # keep-sorted end
  ];
}
