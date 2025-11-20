{
  lib,
  python3Packages,
  _sources',
}:
# broken https://github.com/Zulko/moviepy/issues/1826
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3Packages.setuptools
    python3Packages.wheel
    python3Packages.pythonRelaxDepsHook
  ];

  pythonImportsCheck = [ "moviepy" ];

  propagatedBuildInputs = with python3Packages; [
    numpy
    tqdm
    decorator
    dill
    proglog
    pytesseract
    requests
    imageio
    imageio-ffmpeg
  ];

  pythonRelaxDeps = true;

  meta = with lib; {
    description = "Video editing with Python";
    homepage = "https://pypi.org/project/moviepy/";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
  };
}
