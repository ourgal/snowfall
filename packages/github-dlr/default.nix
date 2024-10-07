{
  lib,
  python3,
  fetchFromGitHub,
  fetchPypi,
  namespace,
}:

let
  argparse = python3.pkgs.buildPythonApplication rec {
    pname = "argparse";
    inherit (lib.${namespace}.sources.${pname}) version;
    pyproject = true;

    src = fetchPypi {
      inherit pname version;
      inherit (lib.${namespace}.sources.${pname}.src) sha256;
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
  pname = "github-dlr";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  inherit (source) version;
  pyproject = true;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
