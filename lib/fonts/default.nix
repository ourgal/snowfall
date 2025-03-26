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
      getPkg = builtins.map (x: x.pkg);
    in
    rec {
      getName = builtins.map (x: x.name);
      myPkgs = getPkg [
        SentyEtherealWander
        swei-nut-sans
      ];
      mono = maple;
      cjk = lib.attrsets.recursiveUpdate { inherit (notoCJK) sans serif; } {
        inherit (swei-nut-sans) sans;
      };
      en = { inherit (noto) sans serif pkg; };
      emoji = [
        fontAwesome
        joypixels
        twemoji
        nerdfonts
      ];
      nixPkgs = getPkg (
        [
          mono
          cjk.sans
          cjk.serif
          en
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
