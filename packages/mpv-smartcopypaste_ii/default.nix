{
  lib,
  pkgs,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "mpv-smartcopypaste_ii";
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

  scriptPath = "scripts/SmartCopyPaste_II.lua";
}
