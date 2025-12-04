args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    disabled
    with'
    enableNixosSubModule'
    ;
  inherit (config.${namespace}.user) host;
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
        # qtile = enabled;
      };
    };

    ${namespace} = enableNixosSubModule' {
      path = _name;
      subModule = "ly";
    };

    services.libinput = enabled;

    hardware = {
      graphics =
        enabled
        // (
          if builtins.elem host [ "office1" ] then
            { }
          else
            {
              enable32Bit = true;
              extraPackages = with' pkgs [
                "intel-media-driver" # LIBVA_DRIVER_NAME=iHD
                "libvdpau-va-gl"
                "nvidia-vaapi-driver"
                "intel-vaapi-driver" # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
                "intel-vaapi-driver" # VA-API and VDPAU
              ];
            }
        );
    };

    # XDG portal
    xdg.portal = enabled // {
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
