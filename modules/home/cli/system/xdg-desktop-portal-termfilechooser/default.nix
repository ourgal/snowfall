args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = "xdg-desktop-portal-termfilechooser";
      confs = {
        "xdg-desktop-portal-termfilechooser/config" = ''
          [filechooser]
          cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/lf-wrapper.sh
          default_dir=$HOME
          open_mode = suggested
          save_mode = suggested
        '';
        "xdg-desktop-portal/portals.conf" = ''
          [preferred]
          org.freedesktop.impl.portal.FileChooser=termfilechooser
        '';
      };
      value = {
        xdg.portal = {
          extraPortals = [ pkgs.xdg-desktop-portal-termfilechooser ];
          config.common.default = "termfilechooser";
        };
      };
    }
  )
)
