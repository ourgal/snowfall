{
  lib,
  python3,
  _sources',
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
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
