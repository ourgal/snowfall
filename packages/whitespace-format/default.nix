{
  lib,
  python3,
  _sources,
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources.whitespace-format) pname version src;
  pyproject = true;

  nativeBuildInputs = [ python3.pkgs.poetry-core ];

  pythonImportsCheck = [ "whitespace_format" ];

  meta = with lib; {
    description = "Linter and formatter for source code files and text files";
    homepage = "https://github.com/DavidPal/whitespace-format";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "whitespace-format";
  };
}
