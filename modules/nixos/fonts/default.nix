args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled with';
  inherit (lib.${namespace}.font)
    defaults
    mono
    cnSans
    cnSerif
    enSans
    enSerif
    emoji
    ;
  value = {
    fonts = {
      fontDir = enabled;
      packages = with' pkgs defaults;
      fontconfig = {
        defaultFonts = {
          inherit emoji;
          monospace = [
            mono
            cnSans
          ];
          sansSerif = [
            cnSans
            enSans
          ];
          serif = [
            cnSerif
            enSerif
          ];
        };
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
