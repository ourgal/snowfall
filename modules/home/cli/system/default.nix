{
  myPkgs = [
    # keep-sorted start
    "cache"
    "ccsum"
    "ch"
    "cron"
    "debounce"
    "is"
    "quickbench"
    "recoverpy"
    "servicer"
    "wol"
    "xrestrict"
    # keep-sorted end
  ];
  nixPkgs = [
    # keep-sorted start
    "bkt"
    "charm-freeze"
    "dcfldd"
    "exfatprogs"
    "flamelens"
    "geekbench"
    "glib"
    "handlr-regex"
    "hot-resize"
    "hwinfo"
    "inxi"
    "isd"
    "kbt" # keyboard tester
    "kmon"
    "nixos-facter"
    "pinentry-all"
    "pipx"
    "screenkey"
    "sequin"
    "sysz"
    "toolbox"
    "topgrade"
    "tray-tui"
    "ugm"
    "wmctrl"
    "xdotool"
    # keep-sorted end
  ];
  nixX86Pkgs = "intentrace";
  xorgPkgs = "xkill";
}
