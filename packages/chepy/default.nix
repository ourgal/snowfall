{
  lib,
  python3,
  fetchFromGitHub,
  fetchPypi,
}:

let
  pycipher = python3.pkgs.buildPythonApplication rec {
    pname = "pycipher";
    version = "0.5.2";
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-5bOz73NGBNoJ4WQvnElqdd+FBmiu5bGIGKOYjuxM1xs=";
      extension = "zip";
    };

    nativeBuildInputs = [
      python3.pkgs.setuptools
      python3.pkgs.wheel
    ];

    pythonImportsCheck = [ "pycipher" ];

    meta = with lib; {
      description = "Several simple cipher algorithms";
      homepage = "https://pypi.org/project/pycipher/";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "pycipher";
    };
  };
  lazy-import = python3.pkgs.buildPythonApplication rec {
    pname = "lazy-import";
    version = "0.2.2";
    pyproject = true;

    src = fetchPypi {
      pname = "lazy_import";
      inherit version;
      hash = "sha256-IUmu+FeUWUB8Ys/szxGFJ5OcmTGs4STzVSNjYGRPij0=";
    };

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
      mainProgram = "lazy-import";
    };
  };
in
python3.pkgs.buildPythonApplication rec {
  pname = "chepy";
  version = "7.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "securisec";
    repo = "chepy";
    rev = version;
    hash = "sha256-MbDTvuMfxBlVsgTiy3xoIqltLyuAsG3nsqEwUcmvogU=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
    python3.pkgs.pythonRelaxDepsHook
  ];

  pythonRelaxDeps = true;

  propagatedBuildInputs = with python3.pkgs; [
    base58
    colorama
    crccheck
    decorator
    docstring-parser
    emoji
    exrex
    fire
    hexdump
    jmespath
    jsonpickle
    lazy-import
    lz4
    msgpack
    parsel
    passlib
    pretty-errors
    prompt-toolkit
    pycipher
    pycryptodome
    pydash
    pyjwt
    pyopenssl
    pyperclip
    pyyaml
    regex
    setuptools
    typing-extensions
  ];

  meta = with lib; {
    description = "Chepy is a python lib/cli equivalent of the awesome CyberChef tool";
    homepage = "https://github.com/securisec/chepy";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "chepy";
  };
}
