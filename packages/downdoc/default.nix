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
