{
  lib,
  python3,
  _sources,
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
in
python3.pkgs.buildPythonApplication {
  inherit (_sources.isd) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    pythonRelaxDepsHook
  ];

  build-system = [
    python3.pkgs.hatchling
  ];

  dependencies = with python3.pkgs; [
    pfzy
    pydantic
    pydantic-settings
    textual
    types-pyyaml
    xdg-base-dirs
  ];

  pythonImportsCheck = [
    "isd"
  ];

  pythonRelaxDeps = true;

  meta = {
    description = "Isd (interactive systemd) – a better way to work with systemd units";
    homepage = "https://github.com/isd-project/isd";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "isd";
  };
}
