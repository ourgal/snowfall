{
  lib,
  python3,
  cargo,
  rustPlatform,
  rustc,
  _sources,
}:
let
  textual = python3.pkgs.buildPythonApplication {
    inherit (_sources.textual) pname version src;
    pyproject = true;

    nativeBuildInputs = [ python3.pkgs.poetry-core ];

    propagatedBuildInputs = with python3.pkgs; [
      markdown-it-py
      rich
      typing-extensions
      platformdirs
    ];

    passthru.optional-dependencies = with python3.pkgs; {
      syntax = [
        tree-sitter
        tree_sitter_languages
      ];
    };

    pythonImportsCheck = [ "textual" ];
  };
  textual-autocomplete = python3.pkgs.buildPythonApplication {
    inherit (_sources.textual-autocomplete) pname version src;
    pyproject = true;

    nativeBuildInputs = [ python3.pkgs.poetry-core ];

    propagatedBuildInputs = [
      textual
      python3.pkgs.typing-extensions
    ];

    pythonImportsCheck = [ "textual_autocomplete" ];
  };
  pydantic = python3.pkgs.buildPythonApplication {
    inherit (_sources.pydantic) pname version src;
    pyproject = true;

    nativeBuildInputs = with python3.pkgs; [
      hatch-fancy-pypi-readme
      hatchling
      pythonRelaxDepsHook
    ];

    propagatedBuildInputs = with python3.pkgs; [
      annotated-types
      pydantic-core
      typing-extensions
    ];

    pythonRelaxDeps = [ "pydantic-core" ];

    passthru.optional-dependencies = with python3.pkgs; {
      email = [ email-validator ];
    };

    pythonImportsCheck = [ "pydantic" ];
  };
  pydantic-settings = python3.pkgs.buildPythonApplication {
    inherit (_sources.pydantic-settings) pname version src;
    pyproject = true;

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
    inherit (_sources.pydantic-core) pname version src;
    pyproject = true;

    cargoDeps = rustPlatform.fetchCargoTarball {
      inherit src;
      name = "${pname}-${version}";
      hash = "sha256-qTQ23hFhIYQSioz791kDG2fdIMlCsIvm29TB0KqocGY=";
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
python3.pkgs.buildPythonApplication {
  inherit (_sources.posting) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    hatchling
    pythonRelaxDepsHook
  ];

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
