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
    "at"
    "bkt"
    "charm-freeze"
    "dcfldd"
    "e2fsprogs"
    "exfatprogs"
    "fdupes"
    "flamelens"
    "geekbench"
    "glib"
    "handlr-regex"
    "hdparm"
    "hot-resize"
    "hwinfo"
    "inxi"
    "isd"
    "iwqr"
    "kbt" # keyboard tester
    "kmon"
    "nixos-facter"
    "pinentry-all"
    "pipx"
    "psmisc"
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
