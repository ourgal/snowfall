{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "jtbl";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication rec {
  inherit pname;
  version = lib.substring 1 (-1) source.version;
  pyproject = true;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
