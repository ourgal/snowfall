{
  lib,
  python3,
  _sources',
}:

python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
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
