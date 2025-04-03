{
  lib,
  buildNpmPackage,
  importNpmLock,
  _sources',
}:
buildNpmPackage rec {
  inherit (_sources' ./.) pname version src;

  npmDeps = importNpmLock { npmRoot = src; };
  inherit (importNpmLock) npmConfigHook;

  dontNpmBuild = true;

  meta = with lib; {
    description = "Local git statistics including GitHub-like contributions calendars";
    homepage = "https://github.com/IonicaBizau/git-stats";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-stats";
    platforms = platforms.all;
  };
}
