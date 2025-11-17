{
  lib,
  python3,
  _sources',
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [ "kdtree" ];

  meta = with lib; {
    description = "A Python implemntation of a kd-tree";
    homepage = "https://pypi.org/project/kdtree/";
    license = licenses.isc;
    maintainers = with maintainers; [ zxc ];
  };
}
