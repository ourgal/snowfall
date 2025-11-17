{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3Packages; [ pythonRelaxDepsHook ];

  pythonRelaxDeps = true;

  build-system = [ python3Packages.hatchling ];

  dependencies = with python3Packages; [ textual ];

  pythonImportsCheck = [ "recoverpy" ];

  meta = {
    description = "Interactively find and recover deleted or :point_right: overwritten :point_left: files from your terminal";
    homepage = "https://github.com/PabloLec/RecoverPy";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "recoverpy";
  };
}
