{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "telegram-desktop";
    value = {
      xdg.mimeApps = {
        enable = true;
        associations.added = {
          "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
        };
        defaultApplications = {
          "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
        };
      };
    };
  }
)
