{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonApplication rec {
  pname = "lazy-import";
  version = "0.2.2";
  pyproject = true;

  src = fetchPypi {
    pname = "lazy_import"; # nvfetcher can't fetch this
    inherit version;
    hash = "sha256-IUmu+FeUWUB8Ys/szxGFJ5OcmTGs4STzVSNjYGRPij0=";
  };

  nativeBuildInputs = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  propagatedBuildInputs = with python3Packages; [ six ];

  pythonImportsCheck = [ "lazy_import" ];

  meta = with lib; {
    description = "A module for lazy loading of Python modules";
    homepage = "https://pypi.org/project/lazy-import/";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ zxc ];
  };
}
