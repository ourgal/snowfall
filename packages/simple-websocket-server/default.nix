{
  lib,
  python3Packages,
  _sources',
}:

python3Packages.buildPythonPackage {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  pythonImportsCheck = [ "SimpleWebSocketServer" ];

  meta = {
    description = "A python based websocket server that is simple and easy to use";
    homepage = "https://github.com/dpallot/simple-websocket-server";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "simple-websocket-server";
  };
}
