{
  lib,
  python3,
  pkgs,
  namespace,
}:
let
  pname = "cat_win";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication rec {
  inherit (source) pname src version;
  pyproject = true;

  nativeBuildInputs = [ python3.pkgs.flit-core ];

  passthru.optional-dependencies = with python3.pkgs; {
    cfix = [ colorama ];
    clip = [ pyperclip ];
  };

  pythonImportsCheck = [ "cat_win" ];

  meta = with lib; {
    description = "Simple OS Independent Text-Processing and -Analytics Command Line Tool made in Python";
    homepage = "https://github.com/SilenZcience/cat_win";
    changelog = "https://github.com/SilenZcience/cat_win/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cat-win";
  };
}