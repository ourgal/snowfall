{
  myPkgs = "gitomatic";
  nixPkgs = [
    # keep-sorted start
    "datalad"
    "git-annex"
    "git-annex-remote-rclone"
    "gitfs"
    # keep-sorted end
  ];
  progs.git.extraConfig = {
    annex.security.allowed-ip-addresses = "all";
  };
  enable = "git-ftp";
}
