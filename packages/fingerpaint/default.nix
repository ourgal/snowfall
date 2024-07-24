{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "fingerpaint";
  version = "1.2.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Wazzaps";
    repo = "fingerpaint";
    rev = "v${version}";
    hash = "sha256-BPpSAaWLmF0JkMijx7pI87tzO/rcjTryxdI2ekTavRY=";
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
