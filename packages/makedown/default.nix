{
  lib,
  python3,
  pkgs,
  namespace,
}:
let
  pname = "makedown";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [ "makedown" ];

  meta = with lib; {
    description = "Organise your shell scripts within executable markdown files";
    homepage = "https://github.com/tzador/makedown";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "makedown";
  };
}
