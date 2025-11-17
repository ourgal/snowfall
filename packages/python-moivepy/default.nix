{
  lib,
  python3,
  _sources',
}:
# broken https://github.com/Zulko/moviepy/issues/1826
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
    python3.pkgs.pythonRelaxDepsHook
  ];

  pythonImportsCheck = [ "moviepy" ];

  propagatedBuildInputs = with python3.pkgs; [
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
