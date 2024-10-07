{
  lib,
  python3,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "animdl";
  source = lib.${namespace}.sources.${pname};
in
python3.pkgs.buildPythonApplication {
  inherit pname;
  version = "unstable-${source.date}";
  format = "pyproject";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
