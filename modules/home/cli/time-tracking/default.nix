args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "focus-timer";
    nixPkgs = [
      # keep-sorted start
      "comodoro"
      "klog-time-tracker"
      "openpomodoro-cli"
      # keep-sorted end
    ];
    enable = "openpomodoro-cli";
  }
)
