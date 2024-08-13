{
  lib,
  python3,
  fetchPypi,
  fetchFromGitHub,
}:
let
  # broken https://github.com/Zulko/moviepy/issues/1826
  moviepy = python3.pkgs.buildPythonApplication rec {
    pname = "moviepy";
    version = "1.0.3";
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-KITjXReIB32z/4nnY8W6e/3b166RCMm8gJ57pY+kM/U=";
    };

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
      mainProgram = "moviepy";
    };
  };
in
python3.pkgs.buildPythonApplication rec {
  pname = "mugen";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scherroman";
    repo = "mugen";
    rev = "v${version}";
    hash = "sha256-4rWcFQwMt19pGQt+zYYbrn0ZJw9bKy++4Lt0l1aorU4=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
    python3.pkgs.pythonRelaxDepsHook
  ];

  pythonImportsCheck = [ "mugen" ];

  propagatedBuildInputs = with python3.pkgs; [
    moviepy
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
