args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "cache";
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
