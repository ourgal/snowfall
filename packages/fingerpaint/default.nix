{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "fingerpaint";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;
  pyproject = true;

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
