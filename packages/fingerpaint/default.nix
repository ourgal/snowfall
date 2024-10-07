{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "fingerpaint";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  version = lib.substring 1 (-1) source.version;
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
    setuptools
    wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    evdev
    pillow
    pyudev
    setuptools
    tkinter
  ];

  pythonImportsCheck = [ "fingerpaint" ];

  meta = with lib; {
    description = "Draw using your laptop's touchpad";
    homepage = "https://github.com/Wazzaps/fingerpaint";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fingerpaint";
  };
}
