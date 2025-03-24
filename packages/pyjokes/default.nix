{
  lib,
  python3,
  _sources',
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname src version;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [ "pyjokes" ];

  meta = with lib; {
    description = "One line jokes for programmers (jokes as a service";
    homepage = "https://github.com/pyjokes/pyjokes";
    license = licenses.bsd3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pyjokes";
  };
}
