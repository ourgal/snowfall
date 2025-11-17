{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

python3Packages.buildPythonApplication rec {
  pname = "pangu-py";
  version = "4.0.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vinta";
    repo = "pangu.py";
    rev = "v${version}";
    hash = "sha256-H/sfd/GThme9i4DO/neZ/sovIHTKAA+6WhmTZGrn8Lo=";
  };

  build-system = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  pythonImportsCheck = [ "pangu" ];

  meta = {
    description = "Paranoid text spacing in Python";
    homepage = "https://github.com/vinta/pangu.py";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "pangu";
  };
}
