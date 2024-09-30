{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "git-crecord";
  version = "20230226.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "andrewshadura";
    repo = "git-crecord";
    rev = version;
    hash = "sha256-zsrMAD9EU+TvkWfWl9x6WbMXuw7YEz50LxQzSFVkKdQ=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [ docutils ];

  pythonImportsCheck = [ "git_crecord" ];

  meta = with lib; {
    description = "Git subcommand to interactively select changes to commit or stage";
    homepage = "https://github.com/andrewshadura/git-crecord";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-crecord";
  };
}
