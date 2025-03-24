{
  lib,
  buildNpmPackage,
  _sources',
}:
buildNpmPackage {
  inherit (_sources' ./.) pname src version;

  npmDepsHash = "sha256-yB111+LFq5DA6MQAMo0EwUNibZUVZUBpVnrZj6u/Xlg=";

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
