{
  nixPkgs = [
    # keep-sorted start
    "biliup-rs"
    "croc"
    "dufs"
    "ffsend"
    "copyparty"
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
