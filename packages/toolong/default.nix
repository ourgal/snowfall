{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "toolong";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication rec {
  inherit pname;
  version = lib.substring 1 (-1) source.version;
  pyproject = true;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
