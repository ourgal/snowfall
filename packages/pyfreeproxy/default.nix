{
  lib,
  python3Packages,
  _sources',
}:

python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  postPatch = "cp ${./requirements.txt} requirements.txt";

  build-system = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  dependencies = with python3Packages; [
    beautifulsoup4
    fake-useragent
    lxml
    platformdirs
    playwright
    prettytable
    requests
  ];

  pythonImportsCheck = [ "freeproxy" ];

  meta = {
    description = "FreeProxy: Collecting free proxies from internet";
    homepage = "https://pypi.org/project/pyfreeproxy/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ zxc ];
  };
}
