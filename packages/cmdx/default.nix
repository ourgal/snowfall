{
  lib,
  stdenv,
  fetchzip,
  _sources,
}:
stdenv.mkDerivation rec {
  inherit (_sources.cmdx) pname version;

  src = fetchzip {
    url = "https://github.com/suzuki-shunsuke/cmdx/releases/download/v${version}/cmdx_linux_amd64.tar.gz";
    hash = "sha256-lo2iv5gYAqGOIBKIgOLNVc8qAACzxzTzhXjJdITNRLE=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D cmdx $out/bin/cmdx
    runHook postInstall
  '';

  meta = with lib; {
    description = "Task runner. It provides useful help messages and supports interactive prompts and validation of arguments";
    homepage = "https://github.com/suzuki-shunsuke/cmdx";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cmdx";
  };
}
