args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      vibe = pkgs._sources.lite-xl-vibe.src;
      fontconfig = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/lite-xl/lite-xl-plugins/master/plugins/fontconfig.lua";
        hash = "sha256-soSWafV94w+A+xSHvL3XQyNgPAFWW+hYPkEabTE820o=";
      };
    in
    {
      path = ./.;
      nixPkgs = "lite-xl";
      value = {
        xdg.configFile = {
          "lite-xl/plugins/lite-xl-vibe".source = vibe;
          "lite-xl/plugins/fontconfig.lua".source = fontconfig;
          "lite-xl/init.lua".source = ./init.lua;
        };
      };
    }
  )
)
