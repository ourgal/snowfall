{
  lib,
  python3,
  _sources',
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
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
