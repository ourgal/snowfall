{ lib, ... }:
let
  inherit (builtins)
    isList
    isString
    isAttrs
    map
    concatStringsSep
    throw
    mapAttrs
    foldl'
    ;
in
{
  font =
    let
      prefix =
        pkg: base:
        mapAttrs (
          _: v: {
            name = "${base} ${v}";
            inherit pkg;
          }
        );
      dejavu = prefix "dejavu_fonts" "DejaVu" {
        sans = "Sans";
        serif = "Serif";
      };
      sourceHan = {
        sans = prefix "source-han-sans" "Source Han Sans" {
          cn = "SC";
          ja = "HW";
          ko = "K";
          hk = "HC";
          tw = "TC";
        };
        serif = prefix "source-han-serif" "Source Han Serif" {
          cn = "SC";
          ja = "HW";
          ko = "K";
          hk = "HC";
          tw = "TC";
        };
        mono = prefix "source-han-mono" "Source Han Mono" {
          cn = "SC";
          ja = "HW";
          ko = "K";
          hk = "HC";
          tw = "TC";
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
      noto = prefix "noto-fonts" "Noto" {
        sans = "Sans";
        serif = "Serif";
      };
      notoCJK = {
        sans = prefix "noto-fonts-cjk-sans" "Noto Sans CJK" {
          ko = "KR";
          hk = "HK";
          ja = "JP";
          cn = "SC";
          tw = "TC";
        };
        serif = prefix "noto-fonts-cjk-serif" "Noto Serif CJK" {
          ko = "KR";
          hk = "HK";
          ja = "JP";
          cn = "SC";
          tw = "TC";
        };
      };
      swei-nut-sans = {
        sans = prefix "swei-nut-sans" "Swei Nut Sans CJK" {
          ja = "JP";
          cn = "SC";
          tw = "TC";
        };
      };
      comicneue = {
        pkg = "comicneue";
        sans = "Comic Neue";
      };
      ChillReunion = prefix "ChillReunion" "寒蝉团圆体" {
        sans = "Sans";
        round = "Round";
      };
      Alatsi = {
        pkg = "Alatsi";
        sans = "Alatsi";
      };
      toneoz-font-pinyin-kai = {
        cn = {
          name = "ToneOZ\-Pinyin\-Kai\-Simplified";
          pkg = "toneoz-font-pinyin-kai";
        };
        tw = {
          name = "ToneOZ\-Pinyin\-Kai\-Traditional";
          pkg = "toneoz-font-pinyin-kai";
        };
      };
      Chillkai = {
        pkg = "Chillkai";
        name = "ChillKai";
      };
      Shanggu = prefix "Shanggu" "Shanggu Mono" {
        cn = "SC";
        ja = "JP";
        tw = "TC";
      };
      getPkg =
        settings: nixPkgs: myPkgs:
        let
          go =
            data:
            if (isList data) then
              foldl' (acc: value: acc ++ go value) [ ] data
            else if (isAttrs data) then
              lib.attrsets.foldlAttrs (
                acc: name: value:
                let
                  res =
                    if (name == "pkg") then
                      [ value ]
                    else if (isAttrs value) then
                      go value
                    else
                      [ ];
                in
                acc ++ res
              ) [ ] data
            else if (isString data) then
              [ data ]
            else
              throw "not supported type";
          pkgList = lib.pipe settings [
            (go)
            (map (x: if (myPkgs ? "${x}") then myPkgs."${x}" else nixPkgs."${x}"))
          ];
        in
        pkgList;
      getName =
        data:
        if (isList data) then
          map (x: x.name) data
        else if (isString data) then
          data
        else if (isAttrs data) then
          data.name
        else
          throw "not supported type";
      update = lib.attrsets.recursiveUpdate;

      # settings
      extras = [ ];
      overrids = {
        cjk = { };
        en = { };
      };
      emoji = [
        nerdfonts
        fontAwesome
        joypixels
        twemoji
      ];
    in
    rec {
      inherit getName emoji;
      cjk = update { inherit (sourceHan) sans serif mono; } overrids.cjk;
      en = update {
        inherit (noto) sans serif;
        mono = firacode;
      } overrids.en;
      allPkgs = getPkg (
        [
          cjk
          en
          maple
        ]
        ++ emoji
        ++ extras
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
              if (isList value) then
                lib.pipe value [
                  (map (x: go name x))
                  (concatStringsSep "")
                ]
              else if (isAttrs value) then
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
              else if (isString value) then
                "<${name}>${value}</${name}>"
              else
                throw "not supported type";
          in
          v;
      in
      acc + go name value
    ) header json;
}
