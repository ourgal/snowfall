{
  lib,
  stdenv,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  makeFlags = [ "PREFIX=$(out)" ];

  preBuild = ''
    substituteInPlace Makefile --replace-fail 'cp' 'install -D -m755'
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
