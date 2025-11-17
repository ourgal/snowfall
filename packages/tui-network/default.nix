{
  lib,
  python3Packages,
  _sources,
  _sources',
}:
let
  textual = python3Packages.buildPythonApplication {
    inherit (_sources.textual) pname version src;
    pyproject = true;

    nativeBuildInputs = [ python3Packages.poetry-core ];

    propagatedBuildInputs = with python3Packages; [
      markdown-it-py
      rich
      typing-extensions
      platformdirs
    ];

    passthru.optional-dependencies = with python3Packages; {
      syntax = [
        tree-sitter
        tree_sitter_languages
      ];
    };

    pythonImportsCheck = [ "textual" ];
  };
  fortune-python = python3Packages.buildPythonApplication {
    inherit (_sources.fortune-python) pname version src;
    pyproject = true;

    build-system = [ python3Packages.setuptools ];

    pythonImportsCheck = [ "fortune" ];

    meta = {
      description = "A Fortune clone in Python";
      homepage = "https://pypi.org/project/fortune-python/";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "fortune-python";
    };
  };
in
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [ python3Packages.poetry-core ];

  nativeBuildInputs = with python3Packages; [ pythonRelaxDepsHook ];

  dependencies = [
    fortune-python
    textual
  ];

  pythonRelaxDeps = true;

  pythonImportsCheck = [ "tui_network" ];

  meta = {
    description = "";
    homepage = "https://github.com/Zatfer17/tui-network";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "tui-network";
  };
}
