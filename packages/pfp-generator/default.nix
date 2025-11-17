{
  lib,
  python3Packages,
  _sources',
}:

python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [ python3Packages.poetry-core ];

  dependencies = with python3Packages; [
    numpy
    opencv-python
    pillow
  ];

  nativeBuildInputs = with python3Packages; [ pythonRelaxDepsHook ];

  pythonImportsCheck = [ "pfp_generator" ];

  pythonRelaxDeps = true;

  meta = {
    description = "Generate a random profile picture based on given text";
    homepage = "https://github.com/trumully/pfp_generator";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "pfp-generator";
  };
}
