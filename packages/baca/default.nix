{
  lib,
  python3,
  _sources',
  pkgs,
  namespace,
}:

python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    appdirs
    beautifulsoup4
    pkgs.${namespace}
    climage
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
