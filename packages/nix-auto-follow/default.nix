{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "nix-auto-follow";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  version = "0.1.0";
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
