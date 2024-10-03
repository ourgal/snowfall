{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "klog-time-tracker";
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
