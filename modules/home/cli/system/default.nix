{
  myPkgs = [
    # keep-sorted start
    "cache"
    "ccsum"
    "debounce"
    "is"
    "quickbench"
    "recoverpy"
    "servicer"
    "wol"
    "xrestrict"
    "cron"
    # keep-sorted end
  ];
  nixPkgs = [
    # keep-sorted start
    "bkt"
    "charm-freeze"
    "exfatprogs"
    "dcfldd"
    "flamelens"
    "geekbench"
    "glib"
    "handlr-regex"
    "hot-resize"
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
