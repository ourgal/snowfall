args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "grit"
      "klog-time-tracker"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "focus-timer"
      "rust-kankan"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "eureka"
      "taskwarrior"
      "todo-sh"
      "ttdl"
      # keep-sorted end
    ];
  }
)
