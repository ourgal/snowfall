{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "toolong";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname version src;
  pyproject = true;

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
