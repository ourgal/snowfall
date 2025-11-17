{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  propagatedBuildInputs = with python3Packages; [ click ];

  pythonImportsCheck = [ "advance_touch" ];

  meta = with lib; {
    description = "Fast creation of files and directories. Mimics the operation of AdvancedNewFile (Vim plugin";
    homepage = "https://pypi.org/project/advance-touch/";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "advance-touch";
  };
}
