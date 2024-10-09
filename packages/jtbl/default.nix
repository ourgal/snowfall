{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "jtbl";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication rec {
  inherit (source) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [ tabulate ];

  pythonImportsCheck = [ "jtbl" ];

  meta = with lib; {
    description = "CLI tool to convert JSON and JSON Lines to terminal, CSV, HTTP, and markdown tables";
    homepage = "https://github.com/kellyjonbrazil/jtbl";
    changelog = "https://github.com/kellyjonbrazil/jtbl/blob/${src.rev}/CHANGELOG";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "jtbl";
  };
}
