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

  pythonImportsCheck = [ "eg" ];

  meta = with lib; {
    description = "Examples at the command line";
    homepage = "https://pypi.org/project/eg/";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "eg";
  };
}
