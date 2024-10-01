{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage rec {
  pname = "downdoc";
  version = "1.0.2-stable";

  src = fetchFromGitHub {
    owner = "opendevise";
    repo = "downdoc";
    rev = "v${version}";
    hash = "sha256-707EMnhD4U+CAZsglylvjFWSltnPRR4+h6e1mh/88ko=";
  };

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
