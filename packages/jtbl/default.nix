{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "jtbl";
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kellyjonbrazil";
    repo = "jtbl";
    rev = "v${version}";
    hash = "sha256-ILQwUpjNueaYR5hxOWd5kZSPhVoFnnS2FcttyKSTPr8=";
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
