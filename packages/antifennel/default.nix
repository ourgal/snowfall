{
  lib,
  stdenv,
  fetchFromSourcehut,
  luajit,
}:

stdenv.mkDerivation {
  pname = "antifennel";
  version = "unstable";

  src = fetchFromSourcehut {
    owner = "~technomancy";
    repo = "antifennel";
    rev = "7cf2a2ec4e2d92e82a396e5b1208454eac0b98ed";
    hash = "sha256-kqKjBk5zzvnA5QcSqegrZULmrDol4eT7Roqxi2TC/8c=";
  };

  buildInputs = [ luajit ];

  installPhase = ''
    runHook preInstall
    install -D ./antifennel $out/bin/antifennel
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
