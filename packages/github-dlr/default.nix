{
  lib,
  python3Packages,
  pkgs,
  namespace,
  _sources',
}:

python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3Packages; [
    poetry-core
    pythonRelaxDepsHook
  ];

  propagatedBuildInputs = with python3Packages; [
    aiohttp
    alive-progress
    pkgs.${namespace}.python-argparse
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
