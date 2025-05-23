{
  lib,
  python3,
  _sources',
}:
let
  source = _sources' ./.;
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src;
  version = builtins.replaceStrings [ "unstable-" "-" ] [ "" "." ] source.version;
  pyproject = true;

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
