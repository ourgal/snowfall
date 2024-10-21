{
  lib,
  python3,
  pkgs,
  namespace,
}:
let
  pname = "classifier";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [ arrow ];

  pythonImportsCheck = [ "classifier" ];

  meta = with lib; {
    description = "Organize files in your directory instantly, by classifying them into different folders";
    homepage = "https://github.com/bhrigu123/classifier";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "classifier";
  };
}
