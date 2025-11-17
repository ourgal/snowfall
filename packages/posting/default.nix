{
  lib,
  python3Packages,
  cargo,
  rustPlatform,
  fetchPypi,
  rustc,
  _sources,
  _sources',
}:
let
  textual = python3Packages.buildPythonApplication {
    inherit (_sources.textual) pname version src;
    pyproject = true;

    nativeBuildInputs = [ python3Packages.poetry-core ];

    propagatedBuildInputs = with python3Packages; [
      markdown-it-py
      rich
      typing-extensions
      platformdirs
    ];

    passthru.optional-dependencies = with python3Packages; {
      syntax = [
        tree-sitter
        tree_sitter_languages
      ];
    };

    pythonImportsCheck = [ "textual" ];
  };
  textual-autocomplete = python3Packages.buildPythonApplication rec {
    pname = "textual-autocomplete";
    version = "3.0.0a13";
    pyproject = true;

    src = fetchPypi {
      pname = "textual_autocomplete";
      inherit version;
      hash = "sha256-21pK6VbdfW3s5T9/aV6X8qt1gZ3Za4ocBk7Flms6sRM=";
    };

    nativeBuildInputs = [ python3Packages.poetry-core ];

    propagatedBuildInputs = [
      textual
      python3Packages.typing-extensions
    ];

    pythonImportsCheck = [ "textual_autocomplete" ];
  };
  pydantic = python3Packages.buildPythonApplication {
    inherit (_sources.pydantic) pname version src;
    pyproject = true;

    nativeBuildInputs = with python3Packages; [
      hatch-fancy-pypi-readme
      hatchling
      pythonRelaxDepsHook
    ];

    propagatedBuildInputs = with python3Packages; [
      annotated-types
      pydantic-core
      typing-extensions
    ];

    pythonRelaxDeps = [ "pydantic-core" ];

    passthru.optional-dependencies = with python3Packages; {
      email = [ email-validator ];
    };

    pythonImportsCheck = [ "pydantic" ];
  };
  pydantic-settings = python3Packages.buildPythonApplication {
    inherit (_sources.pydantic-settings) pname version src;
    pyproject = true;

    nativeBuildInputs = [ python3Packages.hatchling ];

    propagatedBuildInputs = with python3Packages; [
      pydantic
      python-dotenv
    ];

    passthru.optional-dependencies = with python3Packages; {
      toml = [ tomli ];
      yaml = [ pyyaml ];
    };

    pythonImportsCheck = [ "pydantic_settings" ];
  };
  pydantic-core = python3Packages.buildPythonApplication rec {
    inherit (_sources.pydantic-core) pname version src;
    pyproject = true;

    cargoDeps = rustPlatform.fetchCargoVendor {
      inherit src;
      name = "${pname}-${version}";
      hash = "sha256-qTQ23hFhIYQSioz791kDG2fdIMlCsIvm29TB0KqocGY=";
    };

    nativeBuildInputs = [
      cargo
      python3Packages.typing-extensions
      rustPlatform.cargoSetupHook
      rustPlatform.maturinBuildHook
      rustc
    ];

    propagatedBuildInputs = with python3Packages; [ typing-extensions ];

    pythonImportsCheck = [ "pydantic_core" ];
  };
in
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3Packages; [
    hatchling
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3Packages; [
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
    watchfiles
  ];

  pythonRelaxDeps = true;

  pythonImportsCheck = [ "posting" ];

  meta = with lib; {
    description = "The modern API client that lives in your terminal";
    homepage = "https://github.com/darrenburns/posting";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "posting";
  };
}
