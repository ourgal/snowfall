{
  lib,
  python3,
  namespace,
  pkgs,
}:

let
  argparse = python3.pkgs.buildPythonApplication rec {
    pname = "argparse";
    inherit (pkgs.${namespace}.sources.${pname}) version src;
    pyproject = true;

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
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname version src;
  pyproject = true;

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
