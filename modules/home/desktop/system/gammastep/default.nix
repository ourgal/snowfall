args:
args.module (
  args
  // {
    path = ./.;
    servs.gammastep.provider = "geoclue2";
    value.systemd.user.services.gammastep.Unit.ConditionEnvironment = "WAYLAND_DISPLAY";
  }
)
