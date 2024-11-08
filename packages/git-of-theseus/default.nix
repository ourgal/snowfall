{
  lib,
  python3,
  _sources,
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources.git-of-theseus) pname src version;
  pyproject = true;

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
