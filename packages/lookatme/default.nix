{
  lib,
  python3,
  _sources,
}:
python3.pkgs.buildPythonApplication rec {
  inherit (_sources.lookatme) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
    pythonRelaxDepsHook
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
