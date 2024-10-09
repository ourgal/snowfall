{
  lib,
  python3,
  namespace,
  pkgs,
}:
let
  pname = "animdl";
  source = pkgs.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;
  format = "pyproject";

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
    pythonRelaxDepsHook
  ];
  propagatedBuildInputs = with python3.pkgs; [
    anchor-kr
    anitopy
    click
    cssselect
    httpx
    lxml
    packaging
    pkginfo
    pycryptodomex
    pyyaml
    regex
    rich
    tqdm
    yarl
  ];

  preBuild = ''
    sed -i '/comtypes/d' pyproject.toml
  '';

  doCheck = true;

  pythonRelaxDeps = true;

  meta = with lib; {
    description = "A highly efficient, powerful and fast anime scraper";
    homepage = "https://github.com/justfoolingaround/animdl";
    license = licenses.gpl3Only;
    mainProgram = "animdl";
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
  };
}
