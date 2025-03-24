args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    fonts = {
      fontDir = enabled;
      packages = with pkgs; [
        fira-code
        joypixels
        nerdfonts
        source-han-sans
        dejavu_fonts
        twemoji-color-font
        maple-mono-SC-NF
      ];
      fontconfig = {
        defaultFonts =
          let
            mono = [ "Fira Code" ];
            cnSans = [ "Source Han Sans SC" ];
            cnSerif = [ "Source Han Serif SC" ];
            enSans = [ "DejaVu Sans" ];
            enSerif = [ "DejaVu Serif" ];
          in
          {
            emoji = [
              "Symbols Nerd Font"
              "JoyPixels"
              "Twemoji"
            ];
            monospace = mono ++ cnSans;
            sansSerif = cnSans ++ enSans;
            serif = cnSerif ++ enSerif;
          };
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
