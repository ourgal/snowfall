args:
args.module (
  args
  // (
    let
      inherit (args) enabled pkgs;
    in
    {
      path = ./.;
      value = {
        # Theme GTK
        gtk = enabled // {
          theme = {
            name = "catppuccin-frappe-blue-standard";
            package = pkgs.catppuccin-gtk;
          };
          font = {
            name = "Ubuntu";
            size = 12;
            package = pkgs.ubuntu_font_family;
          };
          gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
          gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
        };
      };
    }
  )
)
