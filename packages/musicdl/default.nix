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

  build-system = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  dependencies = with python3Packages; [
    alive-progress
    click
    prettytable
    pycryptodome
    requests
    json-repair
    orjson
    cryptography
    faster-whisper
    fake-useragent
    pathvalidate
    rich
    emoji
    bleach
    beautifulsoup4
    aigpy
    av
    tabulate
    mutagen
    pkgs.${namespace}.pyfreeproxy
  ];

  pythonImportsCheck = [ "musicdl" ];

  meta = {
    description = "Musicdl: A lightweight music downloader written in pure python";
    homepage = "https://github.com/CharlesPikachu/musicdl";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "musicdl";
  };
}
