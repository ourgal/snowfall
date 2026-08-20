{
  nixPkgs = [
    # keep-sorted start
    "git-crecord"
    # keep-sorted end
  ];
  progs.git.settings.interactive = {
    singlekey = true;
  };
}
