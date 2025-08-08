{
  nixPkgs = [
    # keep-sorted start
    "biliup-rs"
    "copyparty"
    "croc"
    "dufs"
    "ffsend"
    "goshs"
    "gossa"
    "imgurbash2"
    "magic-wormhole-rs"
    "miniserve"
    "nfs-utils"
    "pastebinit"
    "pcp"
    "portal"
    "rsync"
    "screego" # TODO
    "sfz"
    "sharing"
    "simple-http-server"
    "sshfs"
    "tmate"
    "tran"
    "tty-share"
    "updog"
    "upterm"
    "webwormhole"
    "wgetpaste"
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
