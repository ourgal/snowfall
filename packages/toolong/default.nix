{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "toolong";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Textualize";
    repo = "toolong";
    rev = "v${version}";
    hash = "sha256-Zd6j1BIrsLJqptg7BXb67qY3DaeHRHieWJoYYCDHaoc=";
  };

  nativeBuildInputs = [
    python3.pkgs.poetry-core
    python3.pkgs.pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    click
    textual
    typing-extensions
  ];

  pythonRelaxDeps = true;

  pythonImportsCheck = [ "toolong" ];

  meta = with lib; {
    description = "A terminal application to view, tail, merge, and search log files (plus JSONL";
    homepage = "https://github.com/Textualize/toolong";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "toolong";
  };
}
