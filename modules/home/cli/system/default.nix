{
  myPkgs = [
    # keep-sorted start
    "cache"
    "ccsum"
    "debounce"
    "is"
    "quickbench"
    "recoverpy"
    "sequin"
    "servicer"
    "wol"
    # keep-sorted end
  ];
  nixPkgs = [
    # keep-sorted start
    "bkt"
    "charm-freeze"
    "exfatprogs"
    "geekbench"
    "glib"
    "handlr-regex"
    "intentrace"
    "inxi"
    "kbt" # keyboard tester
    "kmon"
    "nixos-facter"
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
  xorgPkgs = "xkill";
  enable = "betterlockscreen";
}
