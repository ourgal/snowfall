{
  lib,
  python3,
  pkgs,
  namespace,
}:
let
  pname = "ehh";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pyyaml
    colorama
    click
  ];

  pythonImportsCheck = [ "ehh" ];

  meta = with lib; {
    description = "Commandline tool for remembering linux/terminal commands";
    homepage = "https://github.com/lennardv2/ehh";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "ehh";
  };
}
