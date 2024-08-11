{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = "qrcode";
    nixPkgs = [
      # keep-sorted start
      "croc"
      "dufs"
      "ffsend"
      "nfs-utils"
      "portal"
      "qrcp"
      "rsync"
      "sshfs"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "pbgopy"
      "rclone"
      "syncthing"
      # keep-sorted end
    ];
  }
)
