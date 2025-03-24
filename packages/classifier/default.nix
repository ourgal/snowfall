{
  lib,
  python3,
  _sources',
}:
python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname src version;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
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
