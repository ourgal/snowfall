args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "comodoro"
      "klog-time-tracker"
      "openpomodoro-cli"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "focus-timer"
      "openpomodoro-cli"
      # keep-sorted end
    ];
  }
)
