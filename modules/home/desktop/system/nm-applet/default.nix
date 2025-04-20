args:
args.module (
  args
  // {
    systemdServices.nm-applet = {
      online = true;
      start = "${args.pkgs.networkmanagerapplet}/bin/nm-applet";
    };
  }
)
