{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage rec {
  pname = "eleventy";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "11ty";
    repo = "eleventy";
    rev = "v${version}";
    hash = "sha256-0xyVski+WTfTdYfNUBMKX4fnorGSsbi95WMR8ocSU2Q=";
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
