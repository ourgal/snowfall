{
  lib,
  python3Packages,
  _sources',
}:

python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  pythonImportsCheck = [ "multiplex" ];

  meta = {
    description = "Command-line process mutliplexer";
    homepage = "https://github.com/sebastien/multiplex";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "multiplex";
  };
}
