{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "images-upload-cli";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication rec {
  inherit (source) pname version src;
  pyproject = true;

  nativeBuildInputs = [
    python3.pkgs.poetry-core
    python3.pkgs.poetry-dynamic-versioning
  ];

  propagatedBuildInputs = with python3.pkgs; [
    click
    httpx
    loguru
    pillow
    pyperclip
    python-dotenv
    rich
  ];

  pythonImportsCheck = [ "images_upload_cli" ];

  meta = with lib; {
    description = "Upload images via APIs";
    homepage = "https://github.com/DeadNews/images-upload-cli";
    changelog = "https://github.com/DeadNews/images-upload-cli/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "images-upload-cli";
  };
}
