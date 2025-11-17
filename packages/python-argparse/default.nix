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

  pythonImportsCheck = [ "argparse" ];

  meta = with lib; {
    description = "Python command-line parsing library";
    homepage = "https://pypi.org/project/argparse";
    license = licenses.psfl;
    maintainers = with maintainers; [ zxc ];
  };
}
