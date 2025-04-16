args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      files."Pictures/manga" = [
        ./Makefile
        ./unarchive.sh
        ./convert2avif.sh
        ./convert2webp.sh
        ./convert2jpg.sh
        ./archive.sh
        ./unpack.sh
        ./push.sh
        ./rename.sh
      ];
      value = {
        systemd.user.tmpfiles.rules = [ "d ${config.home.homeDirectory}/Pictures/manga - - - -" ];
      };
    }
  )
)
