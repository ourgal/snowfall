{
  myPkgs = [
    # keep-sorted start
    "kbgrep"
    "play"
    # keep-sorted end
  ];
  myX86Pkgs = "hypergrep";
  nixPkgs = [
    # keep-sorted start
    "ack"
    "ripgrep"
    "ripgrep-all"
    "sift"
    "sig"
    "srgn"
    "ugrep"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "ast-grep"
    "vgrep"
    # keep-sorted end
  ];
}
