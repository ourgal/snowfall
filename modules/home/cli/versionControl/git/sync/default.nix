{
  myPkgs = "gitomatic";
  nixPkgs = [
    # keep-sorted start
    "datalad"
    "git-annex"
    "git-annex-remote-rclone"
    # keep-sorted end
  ];
  progs.git.settings = {
    annex.security.allowed-ip-addresses = "all";
  };
  enable = "git-ftp";
}
