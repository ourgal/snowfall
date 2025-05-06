args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      port = 5600;
    in
    {
      servs.activitywatch = {
        settings = { inherit port; };
        package = pkgs.aw-server-rust;
        watchers = {
          aw-watcher-afk = {
            package = pkgs.activitywatch;
            settings = {
              timeout = 300;
              poll_time = 2;
            };
          };
          aw-watcher-window = {
            package = pkgs.activitywatch;
            settings = {
              poll_time = 1;
              exclude_title = true;
            };
          };
        };
      };
    }
  )
)
