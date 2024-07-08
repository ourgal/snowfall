{
  namespace,
  fetchFromGitHub,
  unstableGitUpdater,
  pkgs,
  ...
}:
pkgs.${namespace}.mkMpvPlugin {
  pname = "mpv-autoloop";

  version = "unstable-2020-08-28";
  src = fetchFromGitHub {
    owner = "zc62";
    repo = "mpv-scripts";
    rev = "a8920592a4dbda574b51ddc6c2000851a13549a5";
    hash = "sha256-pot53UjIJjzehLGxku16dNG1DBwXuOZ7FXQtmnezhwY=";
  };

  scriptPath = "autoloop.lua";

  passthru.updateScript = unstableGitUpdater { };
}
