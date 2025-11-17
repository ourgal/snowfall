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

  pythonImportsCheck = [ "pycipher" ];

  meta = with lib; {
    description = "Several simple cipher algorithms";
    homepage = "https://pypi.org/project/pycipher/";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
  };
}
