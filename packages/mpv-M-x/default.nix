{
  namespace,
  fetchFromGitHub,
  unstableGitUpdater,
  pkgs,
  ...
}:
pkgs.${namespace}.mkMpvPlugin {
  pname = "mpv-M-x";

  version = "unstable-2024-06-28";
  src = fetchFromGitHub {
    owner = "Seme4eg";
    repo = "mpv-scripts";
    rev = "98cc63757654e7ede2533af2b0921afbc4165dc1";
    hash = "sha256-iF4pY+DYnL4DJk4j2DhsUUwmt7KFfj1dWfobzBt9qHI=";
  };

  scriptPath = "M-x.lua";
  extraScripts = [ "script-modules/extended-menu.lua" ];

  preInstall = ''
    substituteInPlace M-x.lua \
      --replace-fail '~~/script-modules/?.lua' "$out/share/mpv/scripts/extended-menu.lua"
  '';

  passthru.updateScript = unstableGitUpdater { };
}
