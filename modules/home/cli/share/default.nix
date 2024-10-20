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
      "magic-wormhole-rs"
      "miniserve"
      "nfs-utils"
      "pcp"
      "portal"
      "rsync"
      "sshfs"
      "tmate"
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
