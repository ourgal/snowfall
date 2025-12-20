args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      confs."chromiumExtensions/youtube-auto-like" = pkgs.fetchzip {
        url = "https://github.com/austencm/youtube-auto-like/releases/download/v2.8.1/release.zip";
        hash = "sha256-fYuBWDU6maHOmf15viwNcsSyajZNcsZZZXyCgO0GUAw=";
        stripRoot = false;
      };
    }
  )
)
