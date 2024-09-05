{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args.pkgs) fetchFromGitHub fetchurl;
      vibe = fetchFromGitHub {
        owner = "eugenpt";
        repo = "lite-xl-vibe";
        rev = "5b5579ab5efe9388c495d5b8baa6cd10b2db53ac";
        hash = "sha256-JSTYmfiy0BeBCVXxOLkXf9SaxPTWrsAam2ZQKn0hk4M=";
      };
      fontconfig = fetchurl {
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
