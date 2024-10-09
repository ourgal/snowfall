{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "rexi";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname version src;

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
