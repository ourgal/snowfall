{
  lib,
  python3Packages,
  _sources',
  pkgs,
  namespace,
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  propagatedBuildInputs = with python3Packages; [
    pkgs.${namespace}.python-kdtree
    pillow
  ];

  pythonImportsCheck = [ "climage" ];

  meta = with lib; {
    description = "Convert images to beautiful ANSI escape codes";
    homepage = "https://pypi.org/project/climage/";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
  };
}
