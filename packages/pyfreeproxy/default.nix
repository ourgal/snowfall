{
  lib,
  python3,
  _sources',
}:

python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  postPatch = "cp ${./requirements.txt} requirements.txt";

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  dependencies = with python3.pkgs; [
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
