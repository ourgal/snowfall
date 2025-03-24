{
  lib,
  stdenv,
  bashInteractive,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  dontBuild = true;

  buildInputs = [ bashInteractive ];

  installPhase = ''
    runHook preInstall
    install -Dm755 jj-fzf -t $out/bin
    patchShebangs --build
    runHook postInstall
  '';

  meta = {
    description = "Text UI for Jujutsu based on fzf, centering around the jj log with key bindings for common operations";
    homepage = "https://github.com/tim-janik/jj-fzf";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "jj-fzf";
    platforms = lib.platforms.all;
  };
}
