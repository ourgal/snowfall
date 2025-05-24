{ lib, ... }:
final: _prev:
let
  inherit (builtins) mapAttrs hasAttr;
  sources = import ../../_sources/generated.nix {
    inherit (final)
      fetchurl
      fetchgit
      fetchFromGitHub
      dockerTools
      ;
  };
  sources' = mapAttrs (
    _n: v:
    v
    // (
      if lib.strings.hasPrefix "emacs-" v.pname then
        {
          pname = lib.strings.removePrefix "emacs-" v.pname;
          version = (builtins.replaceStrings [ "-" ] [ "" ] v.date);
        }
      else if hasAttr "date" v then
        { version = "unstable-${v.date}"; }
      else if final.lib.strings.hasPrefix "v" v.version then
        { version = final.lib.substring 1 (-1) v.version; }
      else
        { }
    )
  ) sources;
in
{
  _sources = sources';
  _sources' =
    path:
    let
      mkModuleCfg =
        root: path: prefix:
        let
          currentDir = toString path;
          fileRoot = lib.snowfall.fs.get-file prefix;
          pathSplit = lib.strings.splitString "/" (lib.strings.removePrefix fileRoot currentDir);
          ret = lib.attrsets.getAttrFromPath pathSplit root;
        in
        ret;
    in
    mkModuleCfg sources' path "packages/";
}
