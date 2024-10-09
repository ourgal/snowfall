{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "git-of-theseus";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;
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
