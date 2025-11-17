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

  propagatedBuildInputs = with python3.pkgs; [ six ];

  pythonImportsCheck = [ "lazy_import" ];

  meta = with lib; {
    description = "A module for lazy loading of Python modules";
    homepage = "https://pypi.org/project/lazy-import/";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ zxc ];
  };
}
