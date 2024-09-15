{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "pnut";
  version = "unstable-2024-09-13";

  src = fetchFromGitHub {
    owner = "udem-dlteam";
    repo = "pnut";
    rev = "96f42c91bfa9f2186cfc56220b19d87727b334dd";
    hash = "sha256-YreKS8ESctkwBhQzQuFU1PHxQyqu6y8h/plr4biQaL4=";
  };

  preBuild = ''
    substituteInPlace Makefile --replace-fail /usr/local/bin $out/bin
    substituteInPlace Makefile --replace-fail 'sudo cp' 'install -D -m755'
  '';

  meta = with lib; {
    description = "A Self-Compiling C Transpiler Targeting Human-Readable POSIX Shell";
    homepage = "https://github.com/udem-dlteam/pnut";
    license = licenses.bsd2;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pnut";
    platforms = platforms.all;
  };
}
