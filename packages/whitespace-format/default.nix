{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "whitespace-format";
  version = "0.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "DavidPal";
    repo = "whitespace-format";
    rev = version;
    hash = "sha256-UscDx0cQ7YqZc6k42ww9Pi9g5nxJCRr+fcETneG0zHc=";
  };

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
