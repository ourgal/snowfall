{
  lib,
  stdenv,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "pnut";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
