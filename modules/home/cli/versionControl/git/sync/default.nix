{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-annex"
      "git-annex-remote-rclone"
      # keep-sorted end
    ];
  }
)
