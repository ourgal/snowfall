{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
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
    ];
    myPkgs = [
      "archwiki"
      "c"
    ];
    # nvtop = "full";
    enable = [
      "clipboard"
      "file-manager"
      "cert"
      "monitor"
      "notification"
      "share"
      "ssh"
      "disk"
      "utils"
      "zip"
    ];
  }
)
