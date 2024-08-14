{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "hexabyte";
  version = "0.8.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "thetacom";
    repo = "hexabyte";
    rev = "v${version}";
    hash = "sha256-r4R4VrPWfMmvv5VxE8uRwij/ku+njV1OSd9kLgJWIvo=";
  };

  nativeBuildInputs = [ python3.pkgs.poetry-core ];

  propagatedBuildInputs = with python3.pkgs; [
    hilbertcurve
    munch
    textual
    toml
  ];

  pythonImportsCheck = [ "hexabyte" ];

  meta = with lib; {
    description = "A modern, modular, and robust TUI hex editor";
    homepage = "https://github.com/thetacom/hexabyte";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hexabyte";
  };
}
