args:
args.module (
  args
  // (
    let
      inherit (args) config lib;
    in
    {
      path = ./.;
      servs.git-sync.repositories.wallpapers = {
        uri = lib.strings.fileContents ./uri.key;
        path = "${config.home.homeDirectory}/Pictures/wallpapers";
        interval = 500;
      };
    }
  )
)
