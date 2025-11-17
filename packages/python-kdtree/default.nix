{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  pythonImportsCheck = [ "kdtree" ];

  meta = with lib; {
    description = "A Python implemntation of a kd-tree";
    homepage = "https://pypi.org/project/kdtree/";
    license = licenses.isc;
    maintainers = with maintainers; [ zxc ];
  };
}
