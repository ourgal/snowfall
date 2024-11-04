args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "images-upload-cli"
      "wush"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "croc"
      "dufs"
      "ffsend"
      "gossa"
      "imgurbash2"
      "magic-wormhole-rs"
      "miniserve"
      "nfs-utils"
      "pcp"
      "portal"
      "rsync"
      "sharing"
      "sshfs"
      "tmate"
      "tran"
      "tty-share"
      "webwormhole"
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
