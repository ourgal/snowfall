{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "lookatme";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "d0c-s4vage";
    repo = "lookatme";
    rev = "v${version}";
    hash = "sha256-mn28OLIlxk97aDow1dTBsMRxVTkCqVeiAtrlyh8zJTg=";
  };

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
