{
  lib,
  namespace,
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}:
let
  sources = lib.${namespace}._sources {
    inherit
      fetchgit
      fetchurl
      fetchFromGitHub
      dockerTools
      ;
  };
  sources' = builtins.mapAttrs (
    n: v:
    v
    // (
      if builtins.hasAttr "date" v then
        if lib.strings.hasPrefix "emacs" n then
          { version = "9999"; }
        else
          { version = "unstable-${v.date}"; }
      else if lib.strings.hasPrefix "v" v.version then
        { version = lib.substring 1 (-1) v.version; }
      else
        { }
    )
  ) sources;
in
sources'
