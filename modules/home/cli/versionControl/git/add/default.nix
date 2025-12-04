{
  nixPkgs = [
    # keep-sorted start
    "diff-so-fancy"
    "git-crecord"
    # keep-sorted end
  ];
  progs.git.settings.interactive = {
    singlekey = true;
  };
}
