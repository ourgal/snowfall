args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled with';
  inherit (lib.${namespace}) font;
  value = {
    fonts = {
      fontDir = enabled;
      packages = (with' pkgs font.nixPkgs) ++ (with' pkgs.${namespace} font.myPkgs);
      fontconfig = {
        defaultFonts = {
          emoji = font.getName font.emoji;
          monospace = [
            font.mono.en
            font.cjk.sans.cn
          ];
          sansSerif = [
            font.cjk.sans.cn
            font.en.sans
          ];
          serif = [
            font.cjk.serif.cn
            font.en.serif
          ];
        };
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
