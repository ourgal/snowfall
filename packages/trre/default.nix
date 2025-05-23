{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname src version;

  installPhase = ''
    install -Dm755 trre trre_dft -t $out/bin
  '';

  meta = {
    description = "Transductive regular expressions";
    homepage = "https://github.com/c0stya/trre";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "trre";
    platforms = lib.platforms.all;
  };
}
