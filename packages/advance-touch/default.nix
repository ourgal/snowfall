{
  lib,
  python3,
  fetchPypi,
  namespace,
}:
let
  pname = "advance-touch";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication rec {
  inherit pname;
  inherit (source) version;
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    inherit (source.src) sha256;
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
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "advance-touch";
  };
}
