args:
args.module (
  args
  // {
    path = ./.;
    progs = [
      "home-manager"
      { fish.shellAbbrs.hms = "home-manager switch"; }
    ];
    value = {
      manual.html.enable = true;
      systemd.user.startServices = "sd-switch";
    };
  }
)
