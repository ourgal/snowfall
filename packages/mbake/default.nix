{
  lib,
  python3,
  _sources',
}:

python3.pkgs.buildPythonApplication rec {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [ python3.pkgs.hatchling ];

  dependencies = with python3.pkgs; [
    rich
    tomli
    typer
  ];

  optional-dependencies = with python3.pkgs; {
    dev = [
      black
      mypy
      pre-commit
      pytest
      pytest-cov
      ruff
      tomli
    ];
  };

  pythonImportsCheck = [ "mbake" ];

  meta = {
    description = "Mbake is a Makefile formatter and linter. It only took 50 years";
    homepage = "https://github.com/EbodShojaei/bake";
    changelog = "https://github.com/EbodShojaei/bake/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "mbake";
  };
}
