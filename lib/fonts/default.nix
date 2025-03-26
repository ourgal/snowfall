{ lib, ... }:
{
  font =
    let
      prefix = p: builtins.mapAttrs (_: v: "${p} ${v}");
      dejavu =
        prefix "DejaVu" {
          sans = "Sans";
          serif = "Serif";
        }
        // {
          pkg = "dejavu_fonts";
        };
      sourceHan = {
        sans =
          (prefix "Source Han Sans" {
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
          (prefix "Source Han Serif" {
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
      noto =
        (prefix "Noto" {
          sans = "Sans";
          serif = "Serif";
        })
        // {
          pkg = "noto-fonts";
        };
      notoCJK = {
        sans =
          (prefix "Noto Sans CJK" {
            ko = "KR";
            hk = "HK";
            ja = "JP";
            cn = "SC";
            tw = "TC";
          })
          // {
            pkg = "noto-fonts-cjk-sans";
          };
        serif =
          (prefix "Noto Serif CJK" {
            ko = "KR";
            hk = "HK";
            ja = "JP";
            cn = "SC";
            tw = "TC";
          })
          // {
            pkg = "noto-fonts-cjk-serif";
          };
      };
      swei-nut-sans = {
        pkg = "swei-nut-sans";
        sans = prefix "Swei Nut Sans CJK" {
          ja = "JP";
          cn = "SC";
          tw = "TC";
        };
      };
      comicneue = {
        pkg = "comicneue";
        sans = "Comic Neue";
      };
      ChillReunion =
        (prefix "寒蝉团圆体" {
          sans = "Sans";
          round = "Round";
        })
        // {
          pkg = "ChillReunion";
        };
      Alatsi = {
        pkg = "Alatsi";
        sans = "Alatsi";
      };
      toneoz-font-pinyin-kai = {
        pkg = "toneoz-font-pinyin-kai";
        cn = "ToneOZ\-Pinyin\-Kai\-Simplified";
        tw = "ToneOZ\-Pinyin\-Kai\-Traditional";
      };
      Chillkai = {
        pkg = "Chillkai";
        name = "ChillKai";
      };
      Shanggu =
        (prefix "Shanggu Mono" {
          cn = "SC";
          ja = "JP";
          tw = "TC";
        })
        // {
          pkg = "Shanggu";
        };
      getPkg = builtins.map (x: x.pkg);
      update = lib.attrsets.recursiveUpdate;
    in
    rec {
      getName = builtins.map (x: x.name);
      myPkgs = getPkg [ Shanggu ];
      mono = {
        en = firacode.name;
        inherit (Shanggu) cn ja tw;
      };
      cjk = update { inherit (sourceHan) sans serif; } { };
      en = update { inherit (noto) sans serif pkg; } { };
      emoji = [
        nerdfonts
        fontAwesome
        joypixels
        twemoji
      ];
      nixPkgs = getPkg (
        [
          cjk.sans
          cjk.serif
          en
          maple
          firacode
        ]
        ++ emoji
      );
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
