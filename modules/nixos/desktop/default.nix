args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    disabled
    enableOpt
    with'
    enableNixosSubModule
    ;
  value = {
    security.rtkit = enabled;

    users.users.${config.${namespace}.user.name} = {
      packages = with' pkgs [
        "git"
        "home-manager"
      ];
    };

    programs = {
      hyprland = enabled // {
        xwayland = enabled;
      };
      sway = enabled;
      niri = enabled // {
        package = pkgs.niri;
      };
    };

    # for swaylock
    security.pam.services.swaylock = { };

    services.xserver = enabled // {
      windowManager = {
        awesome = enabled // {
          luaModules = [
            pkgs.luaPackages.vicious
            pkgs.${namespace}.bling
          ];
          package = pkgs.awesome-git;
        };
        xmonad = disabled;
        qtile = enabled;
      };
    };

    ${namespace} = enableNixosSubModule {
      inherit path;
      subModule = "gdm";
    };

    services.libinput = enabled;

    hardware = {
      opengl =
        enabled
        // enableOpt [
          "driSupport"
          "driSupport32Bit"
        ]
        // {
          extraPackages = with' pkgs [
            "intel-media-driver" # LIBVA_DRIVER_NAME=iHD
            "libvdpau-va-gl"
            "nvidia-vaapi-driver"
            "vaapiIntel" # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
            "vaapiVdpau" # VA-API and VDPAU
          ];
        };
    };

    # XDG portal
    xdg.portal = enabled // {
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
