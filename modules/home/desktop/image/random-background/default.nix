args:
args.module (
  args
  // {
    path = ./.;
    servs.random-background = {
      interval = "10m";
      enableXinerama = false;
      imageDirectory = "%h/Pictures/wallpapers";
    };
    value.systemd.user.services.random-background.Unit.ConditionEnvironment = "XAUTHORITY";
  }
)
