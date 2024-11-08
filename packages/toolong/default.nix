{
  lib,
  python3,
  _sources,
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources.toolong) pname version src;
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
