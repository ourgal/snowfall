{ lib, ... }:
{
  font =
    let
      dejavu =
        builtins.mapAttrs (_: v: "DejaVu ${v}") {
          sans = "Sans";
          serif = "Serif";
        }
        // {
          pkg = "dejavu_fonts";
        };
      sourceHan = {
        sans =
          (builtins.mapAttrs (_: v: "Source Han Sans ${v}") {
            cn = "SC";
            ja = "HW";
            ko = "K";
            hk = "HC";
            tw = "TC";
          })
          // {
            pkg = "source-han-sans";
          };
        serif =
          (builtins.mapAttrs (_: v: "Source Han Serif ${v}") {
            cn = "SC";
            ja = "HW";
            ko = "K";
            hk = "HC";
            tw = "TC";
          })
          // {
            pkg = "source-han-serif";
          };
      };
      joypixels = {
        pkg = "joypixels";
        name = "JoyPixels";
      };
      twemoji = {
        pkg = "twemoji-color-font";
        name = "Twemoji";
      };
      nerdfonts = {
        pkg = "nerdfonts";
        name = "Symbols Nerd Font";
      };
      firacode = {
        pkg = "fira-code";
        name = "Fira Code";
      };
      maple = {
        pkg = "maple-mono-SC-NF";
        name = "Maple Mono SC NF";
      };
      SentyEtherealWander = {
        pkg = "font-SentyEtherealWander";
        name = "SentyEtherealWander";
      };
      fontAwesome = {
        pkg = "font-awesome";
        name = "Font Awesome 6 Free";
      };
    in
    {
      nixPkgs = [
        firacode.pkg
        joypixels.pkg
        nerdfonts.pkg
        sourceHan.sans.pkg
        sourceHan.serif.pkg
        dejavu.pkg
        twemoji.pkg
        maple.pkg
        fontAwesome.pkg
      ];
      myPkgs = [ SentyEtherealWander.pkg ];
      mono = maple.name;
      cnSans = sourceHan.sans.cn;
      cnSerif = sourceHan.serif.cn;
      jaSans = sourceHan.sans.ja;
      jaSerif = sourceHan.serif.ja;
      koSans = sourceHan.sans.ko;
      koSerif = sourceHan.serif.ko;
      hkSans = sourceHan.sans.hk;
      hkSerif = sourceHan.serif.hk;
      twSans = sourceHan.sans.tw;
      twSerif = sourceHan.serif.tw;
      enSans = dejavu.sans;
      enSerif = dejavu.serif;
      emoji = [
        fontAwesome.name
        joypixels.name
        twemoji.name
        nerdfonts.name
      ];
    };
  mkFontconfig =
    header: json:
    lib.attrsets.foldlAttrs (
      acc: name: value:
      let
        go =
          name: value:
          let
            v =
              if (builtins.isList value) then
                lib.pipe value [
                  (builtins.map (x: go name x))
                  (builtins.concatStringsSep "")
                ]
              else if (builtins.isAttrs value) then
                let
                  res =
                    lib.attrsets.foldlAttrs
                      (
                        a: n: v:
                        if (lib.strings.hasPrefix "@" n) then
                          a // { attr = a.attr + " ${(lib.strings.removePrefix "@" n)}=\"${v}\""; }
                        else if (n == "test") then
                          a // { test = a.test + go n v; }
                        else if (n == "edit") then
                          a // { edit = a.edit + go n v; }
                        else
                          a // { other = a.other + go n v; }
                      )
                      {
                        attr = "";
                        test = "";
                        edit = "";
                        other = "";
                      }
                      value;
                in
                "<${name}${res.attr}>${res.test}${res.edit}${res.other}</${name}>"
              else if (builtins.isString value) then
                "<${name}>${value}</${name}>"
              else
                builtins.throw "not supported type";
          in
          v;
      in
      acc + go name value
    ) header json;
}
