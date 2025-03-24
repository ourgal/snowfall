{
  lib,
  buildNpmPackage,
  _sources',
}:

buildNpmPackage rec {
  inherit (_sources' ./.) pname version src;

  npmDepsHash = "sha256-1s0xzQod/6vM3bOxXAqDjjOqp4BpS5G9LAJfSG5osOM";

  dontNpmBuild = true;

  meta = with lib; {
    description = "Rapidly converts AsciiDoc to Markdown";
    homepage = "https://github.com/opendevise/downdoc";
    changelog = "https://github.com/opendevise/downdoc/blob/${src.rev}/CHANGELOG.adoc";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "downdoc";
    platforms = platforms.all;
  };
}
