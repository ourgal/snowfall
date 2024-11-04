args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "cache";
    nixPkgs = [
      # keep-sorted start
      "charm-freeze"
      "geekbench"
      "handlr-regex"
      "kmon"
      "pinentry-all"
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
