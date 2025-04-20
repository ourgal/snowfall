{
  path = ./.;
  nixPkgs = [
    # keep-sorted start
    "gtt"
    "opencc"
    "udict"
    "ydict"
    # keep-sorted end
  ];
  enable = "translate-shell";
}
