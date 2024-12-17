args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib;
      inherit (lib.${namespace}) mime;
    in
    {
      path = ./.;
      defaultApps."mpv.desktop" = mime.video_audio;
    }
  )
)
