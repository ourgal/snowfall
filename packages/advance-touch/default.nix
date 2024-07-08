{
  lib,
  python3,
  fetchPypi,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "advance-touch";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-I4wF4PuhDUnM7YluERJzMWysUODtfUTPOo4nvNSGZ8U=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [ click ];

  pythonImportsCheck = [ "advance_touch" ];

  meta = with lib; {
    description = "Fast creation of files and directories. Mimics the operation of AdvancedNewFile (Vim plugin";
    homepage = "https://pypi.org/project/advance-touch/";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "advance-touch";
  };
}
