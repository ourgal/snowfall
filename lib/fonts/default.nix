{ lib, ... }:
{
  font = {
    nixPkgs = [
      # keep-sorted start
      "fira-code"
      "joypixels"
      "nerdfonts"
      "source-han-sans"
      "dejavu_fonts"
      "twemoji-color-font"
      "maple-mono-SC-NF"
      # keep-sorted end
    ];
    myPkgs = [ "font-SentyEtherealWander" ];
    mono = "Maple Mono SC NF";
    cnSans = "Source Han Sans SC";
    cnSerif = "Source Han Serif SC";
    enSans = "DejaVu Sans";
    enSerif = "DejaVu Serif";
    emoji = [
      "JoyPixels"
      "Twemoji"
      "Symbols Nerd Font"
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
