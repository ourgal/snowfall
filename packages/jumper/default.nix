{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  postInstall = "install -Dm755 jumper -t $out/bin";

  meta = {
    description = "Accurate and fast files/directories' jumper";
    homepage = "https://github.com/homerours/jumper";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "jumper";
    platforms = lib.platforms.all;
  };
}
