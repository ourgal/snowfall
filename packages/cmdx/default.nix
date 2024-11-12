{
  lib,
  stdenv,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.cmdx) pname version src;

  sourceRoot = ".";

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 cmdx -t $out/bin
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
