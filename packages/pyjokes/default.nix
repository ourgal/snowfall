{
  lib,
  python3,
  pkgs,
  namespace,
}:
let
  pname = "pyjokes";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [ "pyjokes" ];

  meta = with lib; {
    description = "One line jokes for programmers (jokes as a service";
    homepage = "https://github.com/pyjokes/pyjokes";
    license = licenses.bsd3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pyjokes";
  };
}
