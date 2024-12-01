args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "images-upload-cli"
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
      "sfz"
      "sharing"
      "sshfs"
      "tmate"
      "tran"
      "tty-share"
      "webwormhole"
      "wush"
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
