{
  lib,
  python3,
  _sources,
  _sources',
}:
let
  textual = python3.pkgs.buildPythonApplication {
    inherit (_sources.textual) pname version src;
    pyproject = true;

    nativeBuildInputs = [ python3.pkgs.poetry-core ];

    propagatedBuildInputs = with python3.pkgs; [
      markdown-it-py
      rich
      typing-extensions
      platformdirs
    ];

    passthru.optional-dependencies = with python3.pkgs; {
      syntax = [
        tree-sitter
        tree_sitter_languages
      ];
    };

    pythonImportsCheck = [ "textual" ];
  };
  fortune-python = python3.pkgs.buildPythonApplication {
    inherit (_sources.fortune-python) pname version src;
    pyproject = true;

    build-system = [ python3.pkgs.setuptools ];

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
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [ python3.pkgs.poetry-core ];

  nativeBuildInputs = with python3.pkgs; [ pythonRelaxDepsHook ];

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
