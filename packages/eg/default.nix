{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "eg";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [ "eg" ];

  meta = with lib; {
    description = "Examples at the command line";
    homepage = "https://pypi.org/project/eg/";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "eg";
  };
}
