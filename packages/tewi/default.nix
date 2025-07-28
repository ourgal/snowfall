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
