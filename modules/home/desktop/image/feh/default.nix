args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) defaultTypes mime;
      defaults = defaultTypes "feh.desktop" mime.image;
      desktopFile = ''
        [Desktop Entry]
        Name=Feh
        Name[en_US]=feh
        GenericName=Image viewer
        GenericName[en_US]=Image viewer
        Comment=Fast Imlib2-based Image Viewer
        Exec=feh %f
        Terminal=false
        Type=Application
        Icon=feh
        Categories=Graphics;2DGraphics;Viewer;
        MimeType=image/bmp;image/gif;image/jpeg;image/jpg;image/pjpeg;image/png;image/tiff;image/x-bmp;image/x-pcx;image/x-png;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-tga;image/x-xbitmap;
        NoDisplay=true
      '';
    in
    {
      path = ./.;
      nixPkgs = "feh";
      confs = {
        "feh/themes" = ''
          feh -B black \
          -F \
          -d \
          --geometry 500x500 \
          --auto-zoom
        '';
      };
      dataFiles = {
        "applications/feh.desktop" = desktopFile;
      };
      value = {
        xdg.mimeApps = {
          enable = true;
          associations.added = defaults;
          defaultApplications = defaults;
        };
      };
    }
  )
)
