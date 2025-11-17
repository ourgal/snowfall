{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname src version;
  pyproject = true;

  nativeBuildInputs = [ python3Packages.hatchling ];

  pythonImportsCheck = [ "pypipe" ];

  meta = with lib; {
    description = "Python pipe command line tool";
    homepage = "https://github.com/bugen/pypipe";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "ppp";
  };
}
