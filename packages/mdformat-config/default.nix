{
  lib,
  python3,
  pkgs,
  namespace,
}:
let
  pname = "mdformat-config";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;
  pyproject = true;

  nativeBuildInputs = [ python3.pkgs.poetry-core ];

  preBuild = ''
    sed -i '/taplo/d' pyproject.toml
  '';

  propagatedBuildInputs = with python3.pkgs; [
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