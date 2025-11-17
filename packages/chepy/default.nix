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
    pkgs.${namespace}.python-lazy-import
    lz4
    msgpack
    parsel
    passlib
    pretty-errors
    prompt-toolkit
    pkgs.${namespace}.python-pycipher
    pycryptodome
    pydash
    pyjwt
    pyopenssl
    pyperclip
    pyyaml
    regex
    setuptools
    typing-extensions
    pgpy
  ];

  meta = with lib; {
    description = "Chepy is a python lib/cli equivalent of the awesome CyberChef tool";
    homepage = "https://github.com/securisec/chepy";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "chepy";
  };
}
