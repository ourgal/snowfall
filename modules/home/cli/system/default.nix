args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "cache"
      "servicer"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "bkt"
      "charm-freeze"
      "geekbench"
      "handlr-regex"
      "inxi"
      "kmon"
      "pinentry-all"
      "pipx"
      "screenkey"
      "sysz"
      "toolbox"
      "topgrade"
      "ugm"
      "wmctrl"
      "xdotool"
      # keep-sorted end
    ];
  }
)
