args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      value.sops.secrets.rclone = {
        mode = "0600";
        path = "${config.xdg.configHome}/rclone/rclone.conf";
      };
    }
  )
)
