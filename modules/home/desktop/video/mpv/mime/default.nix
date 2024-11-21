args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib enabled;
      inherit (lib.${namespace}) defaultTypes mime;
      defaults = defaultTypes "mpv.desktop" mime.video_audio;
    in
    {
      path = ./.;
      value = {
        xdg.mimeApps = enabled // {
          associations.added = defaults;
          defaultApplications = defaults;
        };
      };
    }
  )
)
