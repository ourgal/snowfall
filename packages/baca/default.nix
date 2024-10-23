{
  lib,
  python3,
  pkgs,
  namespace,
}:
let
  kdtree = python3.pkgs.buildPythonApplication rec {
    pname = "kdtree";
    inherit (pkgs.${namespace}.sources.${pname}) version src;
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
  climage = python3.pkgs.buildPythonApplication rec {
    pname = "climage";
    inherit (pkgs.${namespace}.sources.${pname}) version src;
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
  pname = "baca";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname version src;
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
