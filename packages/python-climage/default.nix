{
  lib,
  python3,
  _sources',
  pkgs,
  namespace,
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
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
