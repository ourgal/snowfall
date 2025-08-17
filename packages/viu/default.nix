{
  lib,
  python3,
  _sources',
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname src version;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    hatchling
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    click
    inquirerpy
    requests
    rich
    thefuzz
    yt-dlp
    pycryptodome
    pypresence
    httpx
    pydantic
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    api = [ fastapi ];
    full = [
      fastapi
      mpv
      plyer
    ];
    mpv = [ mpv ];
    notifications = [ plyer ];
  };

  pythonImportsCheck = [ "viu" ];

  pythonRelaxDeps = true;

  meta = with lib; {
    description = "Your browser anime experience from the terminal";
    homepage = "https://github.com/Benexl/viu";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "viu";
  };
}
