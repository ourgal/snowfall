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
          _: v:
          let
            name = if (lib.strings.hasSuffix "\-" base) then "${base}${v}" else "${base} ${v}";
          in
          {
            inherit pkg name;
          }
        );

      # english
      noto = prefix "noto-fonts" "Noto" {
        sans = "Sans";
        serif = "Serif";
      };

      # english monospace

      # english serif
      chunk = {
        pkg = "chunk";
        name = "ChunkFive";
      };

      # cjk
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

      font100_base = {
        pkg = "100font_base";
      };

      font100_extend = {
        pkg = "100font_extend";
      };

      # cjk monospace
      maple = {
        pkg = [
          "maple-mono"
          "NF-CN"
        ];
        name = "Maple Mono SC NF";
      };

      # cjk sans

      # emoji
      joypixels = {
        pkg = "joypixels";
        name = "JoyPixels";
      };
      twemoji = {
        pkg = "twemoji-color-font";
        name = "Twemoji";
      };
      nerdfonts = {
        pkg = [
          "nerd-fonts"
          "symbols-only"
        ];
        name = "Symbols Nerd Font";
      };
      fontAwesome = {
        pkg = "font-awesome";
        name = "Font Awesome 6 Free";
      };
      lilex = {
        pkg = "lilex";
        name = "Lilex";
      };

      getPkg =
        settings: pkgs: namespace:
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
                      if builtins.isString value then
                        [ value ]
                      else if builtins.isList value then
                        [ (lib.attrsets.getAttrFromPath value pkgs) ]
                      else
                        builtins.throw "unknow font pkg name type"
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
            (map (
              x:
              if builtins.isString x then
                if (pkgs.${namespace} ? "${x}") then pkgs.${namespace}."${x}" else pkgs."${x}"
              else
                x
            ))
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
      inherit (lib.attrsets) recursiveUpdate;

      # settings
      extras = [ maple ];
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
      cjk = recursiveUpdate { inherit (sourceHan) sans serif mono; } overrids.cjk;
      en = recursiveUpdate {
        inherit (noto) sans serif;
        mono = lilex;
      } overrids.en;
      allPkgs = getPkg (
        [
          cjk
          en
        ]
        ++ emoji
        ++ extras
      );
      notUse = [
        chunk
        font100_base
        font100_extend
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
