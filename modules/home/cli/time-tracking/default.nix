{
  path = ./.;
  nixPkgs = [
    # keep-sorted start
    "comodoro"
    "klog-time-tracker"
    "openpomodoro-cli"
    # keep-sorted end
  ];
  enable = "focus-timer";
}
