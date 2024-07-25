{
  lib,
  python3,
  fetchFromGitHub,
  fetchPypi,
  cargo,
  rustPlatform,
  rustc,
}:
let
  textual = python3.pkgs.buildPythonApplication rec {
    pname = "textual";
    version = "0.73.0";
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-zNHoczcFd/VX398rNBHypPaLV9Q2X52DoA0ISvsV9aY=";
    };

    nativeBuildInputs = [ python3.pkgs.poetry-core ];

    propagatedBuildInputs = with python3.pkgs; [
      markdown-it-py
      rich
      typing-extensions
    ];

    passthru.optional-dependencies = with python3.pkgs; {
      syntax = [
        tree-sitter
        tree_sitter_languages
      ];
    };

    pythonImportsCheck = [ "textual" ];
  };
  textual-autocomplete = python3.pkgs.buildPythonApplication rec {
    pname = "textual-autocomplete";
    version = "3.0.0a9";
    pyproject = true;

    src = fetchPypi {
      pname = "textual_autocomplete";
      inherit version;
      hash = "sha256-tfPjFIt5Pxcq/mQ6WyGIxewU/LQrY5uYsjExwn5S3oU=";
    };

    nativeBuildInputs = [ python3.pkgs.poetry-core ];

    propagatedBuildInputs = [
      textual
      python3.pkgs.typing-extensions
    ];

    pythonImportsCheck = [ "textual_autocomplete" ];
  };
  pydantic = python3.pkgs.buildPythonApplication rec {
    pname = "pydantic";
    version = "2.7.3";
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-xGx2pAuxKWco16i5mqc91wpIw1EBEf8pADT4YMmcQZ4=";
    };

    nativeBuildInputs = [
      python3.pkgs.hatch-fancy-pypi-readme
      python3.pkgs.hatchling
    ];

    propagatedBuildInputs = with python3.pkgs; [
      annotated-types
      pydantic-core
      typing-extensions
    ];

    passthru.optional-dependencies = with python3.pkgs; {
      email = [ email-validator ];
    };

    pythonImportsCheck = [ "pydantic" ];
  };
  pydantic-settings = python3.pkgs.buildPythonApplication rec {
    pname = "pydantic-settings";
    version = "2.3.4";
    pyproject = true;

    src = fetchPypi {
      pname = "pydantic_settings";
      inherit version;
      hash = "sha256-xYAuPWK3joJSIxm7ybj4/7KK0cmIqZMR0E8qYFH8oKc=";
    };

    nativeBuildInputs = [ python3.pkgs.hatchling ];

    propagatedBuildInputs = with python3.pkgs; [
      pydantic
      python-dotenv
    ];

    passthru.optional-dependencies = with python3.pkgs; {
      toml = [ tomli ];
      yaml = [ pyyaml ];
    };

    pythonImportsCheck = [ "pydantic_settings" ];
  };
  pydantic-core = python3.pkgs.buildPythonApplication rec {
    pname = "pydantic-core";
    version = "2.18.4";
    pyproject = true;

    src = fetchPypi {
      pname = "pydantic_core";
      inherit version;
      hash = "sha256-7DvuraCf+GXDRP87wvQn9ebCZAHMYRPXfjcsP9rHOGQ=";
    };

    cargoDeps = rustPlatform.fetchCargoTarball {
      inherit src;
      name = "${pname}-${version}";
      hash = "sha256-m0xP4fIFgInkUeAy4HqfTKHEiqmWpYO8CgKzxg+WXiU=";
    };

    nativeBuildInputs = [
      cargo
      python3.pkgs.typing-extensions
      rustPlatform.cargoSetupHook
      rustPlatform.maturinBuildHook
      rustc
    ];

    propagatedBuildInputs = with python3.pkgs; [ typing-extensions ];

    pythonImportsCheck = [ "pydantic_core" ];
  };
in
python3.pkgs.buildPythonApplication rec {
  pname = "posting";
  version = "1.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "darrenburns";
    repo = "posting";
    rev = version;
    hash = "sha256-PDJYM/VW5Xhfj+OnOSrWSl47V0somjucjrggdVz+4bs=";
  };

  nativeBuildInputs = [ python3.pkgs.hatchling ];

  propagatedBuildInputs = with python3.pkgs; [
    click
    click-default-group
    httpx
    pydantic
    pydantic-settings
    pyperclip
    python-dotenv
    pyyaml
    textual
    textual-autocomplete
    xdg-base-dirs
  ];

  pythonImportsCheck = [ "posting" ];

  meta = with lib; {
    description = "The modern API client that lives in your terminal";
    homepage = "https://github.com/darrenburns/posting";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "posting";
  };
}
