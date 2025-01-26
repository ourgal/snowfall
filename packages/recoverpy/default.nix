{
  lib,
  python3,
  _sources,
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources.recoverpy) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    pythonRelaxDepsHook
  ];

  pythonRelaxDeps = true;

  build-system = [
    python3.pkgs.hatchling
  ];

  dependencies = with python3.pkgs; [
    textual
  ];

  pythonImportsCheck = [
    "recoverpy"
  ];

  meta = {
    description = "Interactively find and recover deleted or :point_right: overwritten :point_left: files from your terminal";
    homepage = "https://github.com/PabloLec/RecoverPy";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "recoverpy";
  };
}
