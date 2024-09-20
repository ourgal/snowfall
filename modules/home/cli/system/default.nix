{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bluetuith"
      "brotab"
      "charm-freeze"
      "fastfetch"
      "geekbench"
      "kmon"
      "neofetch"
      "onefetch"
      "owofetch"
      "screenkey"
      "sysz"
      "toolbox"
      "topgrade"
      "ugm"
      "ventoy-bin-full"
      "wget"
      "xdotool"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "archwiki"
      "blendr"
      "bluetui"
      "c"
      # keep-sorted end
    ];
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
