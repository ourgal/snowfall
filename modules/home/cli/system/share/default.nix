{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = "qrcode";
    nixPkgs = [
      "croc"
      "dufs"
      "nfs-utils"
      "qrcp"
      "rsync"
      "sshfs"
    ];
    enable = [
      "pbgopy"
      "rclone"
      "syncthing"
    ];
  }
)
