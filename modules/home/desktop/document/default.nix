args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib;
      inherit (lib.${namespace}) defaultTypes mime;
      defaults = lib.attrsets.recursiveUpdate (defaultTypes "writer.desktop" mime.office.doc) (
        defaultTypes "calc.desktop" mime.office.xls
      );
    in
    {
      nixX86Pkgs = "onlyoffice-desktopeditors";
      nixPkgs = [
        # keep-sorted start
        "calibre"
        "evince"
        "libreoffice"
        "readest"
        "zeal"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
        "goldendict-ng"
        "koreader"
        "sioyek"
        "zathura"
        # keep-sorted end
      ];
      value = defaults;
    }
  )
)
