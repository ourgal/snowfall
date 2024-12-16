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
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "calibre"
        "evince"
        "goldendict-ng"
        "koreader"
        "libreoffice"
        "onlyoffice-bin"
        "zeal"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
        "sioyek"
        "zathura"
        # keep-sorted end
      ];
      value = defaults;
    }
  )
)
