{
  lib,
  python3,
  _sources',
}:

python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'license = "MIT"' 'license.text = "MIT"' \
      --replace-fail 'license-files = ["LICEN[CS]E*"]' ' ' \
      --replace-fail '"setuptools>=77.0.3"' '"setuptools"'
  '';

  build-system = [
    python3.pkgs.colorama
    python3.pkgs.setuptools
  ];

  dependencies = with python3.pkgs; [ colorama ];

  pythonImportsCheck = [ "files_sort" ];

  meta = {
    description = "Python-based file sorter that sorts file by extensions, size, and time";
    homepage = "https://github.com/AfzGit/Files-Sort-py";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "files-sort";
  };
}
