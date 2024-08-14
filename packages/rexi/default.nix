{
  lib,
  fetchFromGitHub,
  python3,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "rexi";
  version = "1.1.3";

  src = fetchFromGitHub {
    owner = "royreznik";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-i1iHFnvuxLwMqokuJD0K8pKTJJgGbI0NT5WQ1+6lK0E=";
  };

  format = "pyproject";

  propagatedBuildInputs = with python3.pkgs; [
    typer
    colorama
    textual
  ];

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
    pythonRelaxDepsHook
  ];

  pythonRelaxDeps = true;

  meta = with lib; {
    description = "Terminal UI for Regex Testing";
    mainProgram = "rexi";
    homepage = "https://github.com/royreznik/rexi";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
  };
}
