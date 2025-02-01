args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled with';
  value = {
    fonts = {
      fontDir = enabled;
      packages = with' pkgs [
        "dejavu_fonts"
        "noto-fonts"
        "sarasa-gothic" # 更纱黑体
        "source-han-sans"
        "source-han-serif"
        # hack-font
        # jetbrains-mono
        # noto-fonts-cjk-sans
        # noto-fonts-cjk-serif
        # source-code-pro
      ];
      fontconfig = {
        defaultFonts = {
          emoji = [ "Noto Color Emoji" ];
          monospace = [
            "DejaVu Sans Mono"
            "Source Han Sans SC"
            "Sarasa Mono SC"
          ];
          sansSerif = [
            "DejaVu Sans"
            "Source Han Sans SC"
            "Noto Sans CJK SC"
          ];
          serif = [
            "DejaVu Serif"
            "Source Han Serif SC"
            "Noto Serif CJK SC"
          ];
        };
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
