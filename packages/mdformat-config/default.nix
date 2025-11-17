{
  lib,
  python3Packages,
  _sources',
}:
python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname src version;
  pyproject = true;

  nativeBuildInputs = [ python3Packages.poetry-core ];

  preBuild = ''
    sed -i '/taplo/d' pyproject.toml
  '';

  propagatedBuildInputs = with python3Packages; [
    mdformat
    ruamel-yaml
  ];

  pythonImportsCheck = [ "mdformat_config" ];

  meta = with lib; {
    description = "Mdformat plugin to beautify configuration and data-serialization formats";
    homepage = "https://github.com/hukkin/mdformat-config";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
  };
}
