{
  lib,
  stdenv,
  luajit,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  buildInputs = [ luajit ];

  installPhase = ''
    runHook preInstall
    install -D -m755 antifennel $out/bin/antifennel
    runHook postInstall
  '';

  meta = with lib; {
    description = "Turn Lua code into Fennel code. This compiler does the opposite of what the Fennel compiler does.";
    homepage = "https://git.sr.ht/~technomancy/antifennel";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "antifennel";
    platforms = platforms.all;
  };
}
