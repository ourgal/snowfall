args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      value = {
        systemd.user.services.xbanish = {
          Unit = {
            Description = "Xbanish autohide the mouse";
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
          Service = {
            ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 10";
            ExecStart = "${pkgs.xbanish}/bin/xbanish";
          };
        };
      };
    }
  )
)
