{
  lib,
  python3,
  _sources,
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources.advance-touch) pname version src;
  pyproject = true;

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
