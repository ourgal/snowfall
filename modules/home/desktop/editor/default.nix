{
  path = ./.;
  nixPkgs = [
    # keep-sorted start
    "neovide"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "doom-emacs"
    "lite-xl"
    "vscode"
    "zed-editor"
    # keep-sorted end
  ];
}
