{
  lib,
  python3,
  _sources',
}:

python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [ python3.pkgs.poetry-core ];

  dependencies = with python3.pkgs; [
    numpy
    opencv-python
    pillow
  ];

  nativeBuildInputs = with python3.pkgs; [ pythonRelaxDepsHook ];

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
