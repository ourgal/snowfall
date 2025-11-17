{
  lib,
  python3Packages,
  _sources',
  pkgs,
  namespace,
}:

python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3Packages.setuptools
    python3Packages.wheel
    python3Packages.pythonRelaxDepsHook
  ];

  pythonImportsCheck = [ "mugen" ];

  propagatedBuildInputs = with python3Packages; [
    pkgs.${namespace}.moviepy
    librosa
    pillow
    numpy
    pysrt
    tqdm
    decorator
    dill
    proglog
    pytesseract
  ];

  pythonRelaxDeps = true;

  meta = with lib; {
    description = "A command-line music video generator based on rhythm";
    homepage = "https://github.com/scherroman/mugen";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mugen";
  };
}
