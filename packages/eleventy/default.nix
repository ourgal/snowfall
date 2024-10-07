{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "eleventy";
  source = lib.${namespace}.sources.${pname};
in
buildNpmPackage {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
