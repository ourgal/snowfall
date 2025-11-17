{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication rec {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3Packages; [
    setuptools
    wheel
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3Packages; [
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
