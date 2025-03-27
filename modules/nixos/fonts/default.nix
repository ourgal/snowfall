args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  inherit (lib.${namespace}) font;
  value = {
    fonts = {
      fontDir = enabled;
      packages = font.allPkgs pkgs namespace;
      fontconfig = {
        defaultFonts = {
          emoji = font.getName font.emoji;
          monospace = font.getName [
            font.en.mono
            font.cjk.sans.cn
          ];
          sansSerif = font.getName [
            font.cjk.sans.cn
            font.en.sans
          ];
          serif = font.getName [
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
