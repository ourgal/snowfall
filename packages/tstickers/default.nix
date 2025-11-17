{
  lib,
  python3Packages,
  fetchFromGitHub,
  fetchPypi,
}:
let
  pyrlottie = python3Packages.buildPythonApplication rec {
    pname = "pyrlottie";
    version = "2024.0.1";
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-bYv9eFsc2UVJ6cuEWeqbC7QlI8x/iPPA+B+mpwhWfUw=";
    };

    build-system = [
      python3Packages.poetry-core
      python3Packages.pythonRelaxDepsHook
    ];

    dependencies = with python3Packages; [
      attrs
      deprecation
      numpy
      pillow
    ];

    pythonImportsCheck = [ "pyrlottie" ];

    pythonRelaxDeps = true;

    meta = {
      description = "Convert .tgs and .lottie to .webp or .gif using rlottie";
      homepage = "https://pypi.org/project/pyrlottie/";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "pyrlottie";
    };
  };
in
python3Packages.buildPythonApplication rec {
  pname = "tstickers";
  version = "2024.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "FHPythonUtils";
    repo = "TStickers";
    rev = version;
    hash = "sha256-8gN1AW4xyhOvaPzzjedQTyVWhn2XSiZ/okanUWa6MDE=";
  };

  build-system = [
    python3Packages.poetry-core
    python3Packages.pythonRelaxDepsHook
  ];

  dependencies = with python3Packages; [
    emoji
    loguru
    pillow
    pyrlottie
    requests
    requests-cache
  ];

  optional-dependencies = with python3Packages; {
    pyrlottie = [ pyrlottie ];
    rlottie-python = [ rlottie-python ];
  };

  pythonImportsCheck = [ "tstickers" ];

  pythonRelaxDeps = true;

  meta = {
    description = "Download sticker packs from Telegram";
    homepage = "https://github.com/FHPythonUtils/TStickers";
    changelog = "https://github.com/FHPythonUtils/TStickers/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "t-stickers";
  };
}
