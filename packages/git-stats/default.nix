{
  lib,
  buildNpmPackage,
  _sources',
}:
buildNpmPackage {
  inherit (_sources' ./.) pname version src;

  npmDepsHash = "sha256-2Bg/VeJYo6Esm/TgfH/1c3/HU1Tl47xJtGxKyNYbEeo=";

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
