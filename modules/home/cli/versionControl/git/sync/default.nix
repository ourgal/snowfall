args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-annex"
      "git-annex-utils"
      "git-annex-remote-rclone"
      "gitfs"
      # keep-sorted end
    ];
    enable = "git-ftp";
  }
)
