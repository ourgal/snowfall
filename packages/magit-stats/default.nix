{
  lib,
  buildNpmPackage,
  _sources',
}:

buildNpmPackage {
  inherit (_sources' ./.) pname version src;

  npmDepsHash = "sha256-Dnf5oDfWRF/0ICQ0/VobSovEJeJcontt63j7ObAn2Fg=";

  meta = {
    description = "A git statistics report generator that can be used both as an individual CLI Tool or called from inside Emacs";
    homepage = "https://github.com/LionyxML/magit-stats";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "magit-stats";
    platforms = lib.platforms.all;
  };
}
