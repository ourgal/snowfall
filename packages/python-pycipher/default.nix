{
  lib,
  python3Packages,
  fetchPypi,
}:

python3Packages.buildPythonApplication rec {
  pname = "pycipher";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5bOz73NGBNoJ4WQvnElqdd+FBmiu5bGIGKOYjuxM1xs=";
    extension = "zip"; # nvfetcher don't support zip
  };

  build-system = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  pythonImportsCheck = [ "pycipher" ];

  meta = {
    description = "Several simple cipher algorithms";
    homepage = "https://pypi.org/project/pycipher/#files";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
  };
}
