{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "simple-websocket-server";
  version = "unstable-2022-10-21";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dpallot";
    repo = "simple-websocket-server";
    rev = "7a9b03766d3a9b1dbbdf671a3bbc6f555806dffe";
    hash = "sha256-KWkXLc9k00GHbmz+U8QR4LMiDg7NIItYJajVYeP6SXY=";
  };

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [
    "SimpleWebSocketServer"
  ];

  meta = {
    description = "A python based websocket server that is simple and easy to use";
    homepage = "https://github.com/dpallot/simple-websocket-server";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "simple-websocket-server";
  };
}
