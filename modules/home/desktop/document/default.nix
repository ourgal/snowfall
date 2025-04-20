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
      nixPkgs = [
        # keep-sorted start
        "calibre"
        "evince"
        "libreoffice"
        "onlyoffice-bin"
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
