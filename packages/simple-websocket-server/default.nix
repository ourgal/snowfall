{
  lib,
  python3,
  _sources',
}:

python3.pkgs.buildPythonPackage {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
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
