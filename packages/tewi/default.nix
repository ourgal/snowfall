{
  lib,
  python3Packages,
  _sources',
  pkgs,
  namespace,
}:

python3Packages.buildPythonApplication rec {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3Packages; [
    setuptools
    wheel
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3Packages; [
    textual
    transmission-rpc
    pyperclip
    pkgs.${namespace}.python-geoip2fast
    qbittorrent-api
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
