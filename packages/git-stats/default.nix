{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage rec {
  pname = "git-stats";
  version = "3.2.0";

  src = fetchFromGitHub {
    owner = "IonicaBizau";
    repo = "git-stats";
    rev = version;
    hash = "sha256-LhsesKHPggV7asOcJCPS/o4O5jP4WVlSiDXIWlyj8Yc=";
  };

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
