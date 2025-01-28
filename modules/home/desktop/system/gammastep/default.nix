args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      servs.gammastep.provider = "geoclue2";
      value = {
        systemd.user.services.gammastep = {
          Service.ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 10";
          Unit.ConditionEnvironment = "WAYLAND_DISPLAY";
        };
      };
    }
  )
)
