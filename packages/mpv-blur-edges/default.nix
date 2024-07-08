{
  namespace,
  fetchFromGitHub,
  unstableGitUpdater,
  pkgs,
}:
pkgs.${namespace}.mkMpvPlugin {
  pname = "mpv-blur-edges";

  version = "unstable-2024-01-11";
  src = fetchFromGitHub {
    owner = "occivink";
    repo = "mpv-scripts";
    rev = "d0390c8e802c2e888ff4a2e1d5e4fb040f855b89";
    hash = "sha256-pc2aaO7lZaoYMEXv5M0WI7PtmqgkNbdtNiLZZwVzppM=";
  };

  scriptPath = "scripts/blur-edges.lua";

  passthru.updateScript = unstableGitUpdater { };
}
