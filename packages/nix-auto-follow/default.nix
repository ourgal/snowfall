{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication {
  pname = "nix-auto-follow";
  version = "0.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fzakaria";
    repo = "nix-auto-follow";
    rev = "8994bf9d68e37352fe3eb2d8d506f3b5418fdc9f";
    hash = "sha256-FCKSd8Sunogt3wM/d+Zaz9R1wXPmTsNS2ctJy+s2uDA=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.setuptools-scm
    python3.pkgs.wheel
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    dev = [
      black
      coverage
      flake8
      flake8-print
      isort
      mypy
      pytest
    ];
  };

  pythonImportsCheck = [ "nix_auto_follow" ];

  meta = with lib; {
    description = "A script to achieve automatically following all flake inputs for Nix";
    homepage = "https://github.com/fzakaria/nix-auto-follow";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "nix-auto-follow";
  };
}
