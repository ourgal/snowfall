args:
args.module (
  args
  // (
    let
      inherit (args)
        enabled
        pkgs
        lib
        config
        ;
    in
    {
      value = lib.mkIf (!config.stylix.enable) {
        # Theme GTK
        gtk = enabled // {
          theme =
            if config.catppuccin.enable then
              {
                name = "catppuccin-frappe-blue-standard";
                package = pkgs.catppuccin-gtk;
              }
            else
              {
                name = "tokyonight-dark";
                package = pkgs.tokyonight-gtk-theme;
              };
          font = {
            name = "Ubuntu";
            size = 12;
            package = pkgs.ubuntu-classic;
          };
          gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
          gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
        };
      };
    }
  )
)
