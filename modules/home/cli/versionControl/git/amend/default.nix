{
  nixPkgs = [
    # keep-sorted start
    "git-absorb"
    "git-instafix"
    "patchy"
    # keep-sorted end
  ];
  progs.git.settings.absorb = {
    autoStageIfNothingStaged = true;
    oneFixupPerCommit = true;
  };
}
