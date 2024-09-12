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
      "geekbench"
      "kmon"
      "neofetch"
      "onefetch"
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
    # nvtop = "full";
    enable = [
      # keep-sorted start
      "clipboard"
      "disk"
      "file-manager"
      "i3lock-color"
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
