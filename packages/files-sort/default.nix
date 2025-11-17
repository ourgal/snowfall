{
  lib,
  python3Packages,
  _sources',
}:

python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'license = "MIT"' 'license.text = "MIT"' \
      --replace-fail 'license-files = ["LICEN[CS]E*"]' ' ' \
      --replace-fail '"setuptools>=77.0.3"' '"setuptools"'
  '';

  build-system = [
    python3Packages.colorama
    python3Packages.setuptools
  ];

  dependencies = with python3Packages; [ colorama ];

  pythonImportsCheck = [ "files_sort" ];

  meta = {
    description = "Python-based file sorter that sorts file by extensions, size, and time";
    homepage = "https://github.com/AfzGit/Files-Sort-py";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "files-sort";
  };
}
