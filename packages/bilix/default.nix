{
  lib,
  python3,
  fetchPypi,
  _sources,
  _sources',
}:
let
  construct = python3.pkgs.buildPythonApplication rec {
    pname = "construct";
    version = "2.8.8";
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-G4S4FH9v0VvPZLc3w+isUQCBGtgMgwy0slRRQFEcQVc=";
    };

    build-system = [
      python3.pkgs.setuptools
      python3.pkgs.wheel
    ];

    optional-dependencies = with python3.pkgs; {
      extras = [
        arrow
        cloudpickle
        cryptography
        lz4
        numpy
        ruamel-yaml
      ];
    };

    pythonImportsCheck = [ "construct" ];

    meta = {
      description = "A powerful declarative symmetric parser/builder for binary data";
      homepage = "https://pypi.org/project/construct/";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
    };
  };
  bs4 = python3.pkgs.buildPythonApplication {
    inherit (_sources.bs4) pname version src;
    pyproject = true;

    build-system = [ python3.pkgs.hatchling ];

    dependencies = with python3.pkgs; [ beautifulsoup4 ];

    pythonImportsCheck = [ "bs4" ];

    meta = {
      description = "Dummy package for Beautiful Soup (beautifulsoup4";
      homepage = "https://pypi.org/project/bs4/";
      license = lib.licenses.unfree; # FIXME: nix-init did not find a license
      maintainers = with lib.maintainers; [ zxc ];
    };
  };
  pymp4 = python3.pkgs.buildPythonApplication {
    inherit (_sources.pymp4) pname version src;
    pyproject = true;

    build-system = [ python3.pkgs.poetry-core ];

    dependencies = [ construct ];

    pythonImportsCheck = [ "pymp4" ];

    meta = {
      description = "Python parser for MP4 boxes";
      homepage = "https://pypi.org/project/pymp4/";
      license = lib.licenses.asl20;
      maintainers = with lib.maintainers; [ zxc ];
    };
  };
  danmakuc = python3.pkgs.buildPythonApplication {
    inherit (_sources.danmakuc) pname version src;
    pyproject = true;

    build-system = [
      python3.pkgs.pybind11
      python3.pkgs.setuptools
    ];

    dependencies = with python3.pkgs; [ protobuf ];

    pythonImportsCheck = [ "danmakuC" ];

    meta = {
      description = "Faster conversion for larger Danmaku to Ass format";
      homepage = "https://pypi.org/project/danmakuC/";
      license = lib.licenses.gpl3Only;
      maintainers = with lib.maintainers; [ zxc ];
    };
  };
in
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [ python3.pkgs.hatchling ];

  dependencies = with python3.pkgs; [
    aiofiles
    anyio
    browser-cookie3
    bs4
    click
    danmakuc
    httpx
    json5
    m3u8
    pycryptodome
    pydantic
    pymp4
    rich
  ];

  pythonImportsCheck = [ "bilix" ];

  meta = {
    description = "Lightning-fast async download tool for bilibili and more";
    homepage = "https://github.com/HFrost0/bilix";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "bilix";
  };
}
