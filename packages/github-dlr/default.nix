{
  lib,
  python3,
  fetchFromGitHub,
  fetchPypi,
}:

let
  argparse = python3.pkgs.buildPythonApplication rec {
    pname = "argparse";
    version = "1.4.0";
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-YrCJpVvh2JSc0rx+DfC9254Cj678jDIDjMhIYq791uQ=";
    };

    nativeBuildInputs = [
      python3.pkgs.setuptools
      python3.pkgs.wheel
    ];

    pythonImportsCheck = [ "argparse" ];

    meta = with lib; {
      description = "Python command-line parsing library";
      homepage = "https://pypi.org/project/argparse";
      license = licenses.unfree; # FIXME: nix-init did not found a license
      maintainers = with maintainers; [ zxc ];
      mainProgram = "argparse";
    };
  };
in
python3.pkgs.buildPythonApplication rec {
  pname = "github-dlr";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rocktimsaikia";
    repo = "github-dlr";
    rev = version;
    hash = "sha256-vXLrX3gWx1K77TA79dOxaC2U59ZWpS0PGQnUHIb+BxI=";
  };

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3.pkgs; [
    aiohttp
    alive-progress
    argparse
    emoji
  ];

  pythonImportsCheck = [ "github_dlr" ];

  pythonRelaxDeps = true;

  meta = with lib; {
    description = "Download individual files and folders from Github recursively";
    homepage = "https://github.com/rocktimsaikia/github-dlr";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "github-dlr";
  };
}
