args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib;
      inherit (lib.${namespace}) defaultTypes mime;
      defaults = defaultTypes "mpv.desktop" mime.video_audio;
    in
    {
      path = ./.;
      value = defaults;
    }
  )
)
