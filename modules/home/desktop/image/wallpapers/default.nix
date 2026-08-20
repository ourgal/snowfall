args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      servs.git-sync.repositories.wallpapers = {
        uri = "https://gitee.com/fairever/wallpapers";
        path = "${config.home.homeDirectory}/Pictures/wallpapers";
        interval = 500;
      };
    }
  )
)
