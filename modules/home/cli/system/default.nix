{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bluetuith"
      "charm-freeze"
      "fastfetch"
      "kmon"
      "onefetch"
      "screenkey"
      "sysz"
      "toolbox"
      "topgrade"
      "ventoy-bin-full"
      "wget"
      "xdotool"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "archwiki"
      "c"
      # keep-sorted end
    ];
    # nvtop = "full";
    enable = [
      # keep-sorted start
      "clipboard"
      "disk"
      "file-manager"
      "monitor"
      "notification"
      "share"
      "ssh"
      "utils"
      "zip"
      # keep-sorted end
    ];
  }
)
