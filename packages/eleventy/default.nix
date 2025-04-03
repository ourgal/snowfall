{
  lib,
  buildNpmPackage,
  importNpmLock,
  _sources',
}:
buildNpmPackage rec {
  inherit (_sources' ./.) pname src version;

  npmDeps = importNpmLock { npmRoot = src; };
  inherit (importNpmLock) npmConfigHook;

  dontNpmBuild = true;

  meta = with lib; {
    description = "A simpler site generator. Transforms a directory of templates (of varying types) into HTML";
    homepage = "https://github.com/11ty/eleventy";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "eleventy";
    platforms = platforms.all;
  };
}
