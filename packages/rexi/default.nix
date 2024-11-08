{
  lib,
  python3,
  _sources,
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources.rexi) pname version src;

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
