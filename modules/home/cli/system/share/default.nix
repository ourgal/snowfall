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
      "miniserve"
      "nfs-utils"
      "pcp"
      "portal"
      "qrcp"
      "rsync"
      "sshfs"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "oneshot"
      "pbgopy"
      "rclone"
      "rustypaste-cli"
      "syncthing"
      # keep-sorted end
    ];
  }
)
