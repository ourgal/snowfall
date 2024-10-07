{
  lib,
  fetchFromGitHub,
  python3,
  namespace,
}:
let
  pname = "rexi";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
