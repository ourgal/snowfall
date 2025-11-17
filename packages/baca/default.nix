{
  lib,
  python3Packages,
  _sources',
  pkgs,
  namespace,
}:

python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3Packages; [
    poetry-core
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3Packages; [
    appdirs
    beautifulsoup4
    pkgs.${namespace}.python-climage
    fuzzywuzzy
    markdownify
    peewee
    textual
  ];

  pythonImportsCheck = [ "baca" ];

  pythonRelaxDeps = true;

  meta = with lib; {
    description = "TUI Ebook Reader";
    homepage = "https://github.com/wustho/baca";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "baca";
  };
}
