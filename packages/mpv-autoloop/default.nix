{
  lib,
  fetchFromGitHub,
  pkgs,
  namespace,
}:
let
  pname = "mpv-autoloop";
  source = lib.${namespace}.sources.${pname};
in
pkgs.${namespace}.mkMpvPlugin {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  scriptPath = "autoloop.lua";
}
