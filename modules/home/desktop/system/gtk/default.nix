{ ... }@args:
args.module (
  args
  // (
    with args;
    let
      inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
    in
    {
      path = ./.;
      value = {
        # Theme GTK
        gtk = enabled // {
          font = {
            name = "Ubuntu";
            size = 12;
            package = pkgs.ubuntu_font_family;
          };
          theme = {
            name = "${config.colorScheme.slug}";
            package = gtkThemeFromScheme { scheme = config.colorScheme; };
          };
          # iconTheme = {
          #   name = "Papirus-Dark";
          #   package = pkgs.papirus-icon-theme;
          # };
          gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = 1;
          };
          gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = 1;
          };
        };
      };
    }
  )
)
