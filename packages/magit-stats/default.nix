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

  meta = {
    description = "A git statistics report generator that can be used both as an individual CLI Tool or called from inside Emacs";
    homepage = "https://github.com/LionyxML/magit-stats";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "magit-stats";
    platforms = lib.platforms.all;
  };
}
