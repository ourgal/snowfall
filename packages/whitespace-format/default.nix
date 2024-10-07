{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "whitespace-format";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  inherit (source) version;
  pyproject = true;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
