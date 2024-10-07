{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "fast-anime";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  version = "2.6.6";
  pyproject = true;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    click
    inquirerpy
    requests
    rich
    thefuzz
    yt-dlp
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

  pythonImportsCheck = [ "fastanime" ];

  pythonRelaxDeps = [ "requests" ];

  meta = with lib; {
    description = "Your browser anime experience from the terminal";
    homepage = "https://github.com/Benex254/FastAnime";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fast-anime";
  };
}
