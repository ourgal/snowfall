{
  namespace,
  fetchFromGitHub,
  unstableGitUpdater,
  pkgs,
}:
pkgs.${namespace}.mkMpvPlugin {
  pname = "mpv-smartcopypaste_ii";

  version = "unstable-2023-09-23";
  src = fetchFromGitHub {
    owner = "Eisa01";
    repo = "mpv-scripts";
    rev = "48d68283cea47ff8e904decc9003b3abc3e2123e";
    hash = "sha256-95CAKjBRELX2f7oWSHFWJnI0mikAoxhfUphe9k51Qf4=";
  };

  scriptPath = "scripts/SmartCopyPaste_II.lua";

  passthru.updateScript = unstableGitUpdater { };
}
