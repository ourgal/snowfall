{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication {
  pname = "git-of-theseus";
  version = "unstable-2024-11-26";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "erikbern";
    repo = "git-of-theseus";
    rev = "961bda027ffa9fcd8bbe99d5b8809cc0eaa86464";
    hash = "sha256-FZXLJbximJWrDyuRril6whlOYWppGLns3k8sDNRmOuI=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    gitpython
    matplotlib
    numpy
    progressbar2
    pygments
    scipy
    tqdm
    wcmatch
  ];

  pythonImportsCheck = [ "git_of_theseus" ];

  meta = with lib; {
    description = "Analyze how a Git repo grows over time";
    homepage = "https://github.com/erikbern/git-of-theseus";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-of-theseus";
  };
}
