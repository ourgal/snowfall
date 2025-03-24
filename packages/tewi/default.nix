{
  lib,
  python3,
  _sources,
  _sources',
}:
let
  geoip2fast = python3.pkgs.buildPythonApplication {
    inherit (_sources.geoip2fast) pname version src;
    pyproject = true;

    nativeBuildInputs = [
      python3.pkgs.setuptools
      python3.pkgs.wheel
    ];

    pythonImportsCheck = [ "geoip2fast" ];
  };
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
in
python3.pkgs.buildPythonApplication rec {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    textual
    transmission-rpc
    pyperclip
    geoip2fast
  ];

  pythonRelaxDeps = true;

  meta = with lib; {
    description = "Text-based interface for the Transmission BitTorrent daemon";
    homepage = "https://github.com/anlar/tewi";
    changelog = "https://github.com/anlar/tewi/blob/${src.rev}/CHANGELOG.md";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tewi";
  };
}
