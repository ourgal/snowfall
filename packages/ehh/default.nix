{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname src version;
  pyproject = true;

  nativeBuildInputs = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  propagatedBuildInputs = with python3Packages; [
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
