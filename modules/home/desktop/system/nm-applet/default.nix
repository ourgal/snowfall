args:
args.module (
  args
  // {
    path = ./.;
    systemdServices.nm-applet = {
      online = true;
      start = "${args.pkgs.networkmanagerapplet}/bin/nm-applet";
    };
  }
)
