args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "cache"
      "debounce"
      "is"
      "recoverpy"
      "sequin"
      "servicer"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "bkt"
      "charm-freeze"
      "geekbench"
      "glib"
      "handlr-regex"
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
  }
)
