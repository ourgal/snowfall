{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "lookatme";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication rec {
  inherit (source) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
    python3.pkgs.pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    click
    marshmallow
    mistune
    pygments
    pyyaml
    urwid
  ];

  pythonRelaxDeps = true;

  preBuild = ''
    substituteInPlace setup.py --replace-fail {{VERSION}} v2.5.0
  '';

  pythonImportsCheck = [ "lookatme" ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/d0c-s4vage/lookatme";
    changelog = "https://github.com/d0c-s4vage/lookatme/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "lookatme";
  };
}
