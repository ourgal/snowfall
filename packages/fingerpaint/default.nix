{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname src version;
  pyproject = true;

  nativeBuildInputs = with python3Packages; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with python3Packages; [
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
