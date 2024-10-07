{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "git-of-theseus";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  version = "unstable-${source.date}";
  pyproject = true;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
