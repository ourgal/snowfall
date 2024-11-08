{
  lib,
  python3,
  _sources,
}:
let
  kdtree = python3.pkgs.buildPythonApplication {
    inherit (_sources.kdtree) pname version src;
    pyproject = true;

    nativeBuildInputs = [
      python3.pkgs.setuptools
      python3.pkgs.wheel
    ];

    pythonImportsCheck = [ "kdtree" ];

    meta = with lib; {
      description = "A Python implemntation of a kd-tree";
      homepage = "https://pypi.org/project/kdtree/";
      license = licenses.isc;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "kdtree";
    };
  };
  climage = python3.pkgs.buildPythonApplication {
    inherit (_sources.climage) pname version src;
    pyproject = true;

    nativeBuildInputs = [
      python3.pkgs.setuptools
      python3.pkgs.wheel
    ];

    propagatedBuildInputs = with python3.pkgs; [
      kdtree
      pillow
    ];

    pythonImportsCheck = [ "climage" ];

    meta = with lib; {
      description = "Convert images to beautiful ANSI escape codes";
      homepage = "https://pypi.org/project/climage/";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "climage";
    };
  };
in
python3.pkgs.buildPythonApplication {
  inherit (_sources.baca) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    appdirs
    beautifulsoup4
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
