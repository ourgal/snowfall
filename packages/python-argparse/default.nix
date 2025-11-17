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

  pythonImportsCheck = [ "argparse" ];

  meta = with lib; {
    description = "Python command-line parsing library";
    homepage = "https://pypi.org/project/argparse";
    license = licenses.psfl;
    maintainers = with maintainers; [ zxc ];
  };
}
