{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3Packages; [
    setuptools
    wheel
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
