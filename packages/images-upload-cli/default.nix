{
  lib,
  python3,
  _sources,
}:
python3.pkgs.buildPythonApplication rec {
  inherit (_sources.images-upload-cli) pname version src;
  pyproject = true;

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
    poetry-dynamic-versioning
    pythonRelaxDepsHook
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

  pythonRelaxDeps = true;

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
