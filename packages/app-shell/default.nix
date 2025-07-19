{
  lib,
  stdenv,
  _sources',
  bash,
  shellcheck,
  makeWrapper,
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  unpackPhase = "true";
  buildPhase = "true";

  buildInputs = [ bash ];
  checkInputs = [ shellcheck ];
  nativeBuildInputs = [ makeWrapper ];

  doCheck = true;
  checkPhase = ''shellcheck $src/app-shell.bash'';

  installPhase = ''
    mkdir -p $out/bin $out/share/nix

    cp -a $src/app-shell.nix $out/share/nix

    cp $src/app-shell.bash $out/bin/app-shell
    chmod +x $out/bin/app-shell

    wrapProgram $out/bin/app-shell \
      --set APP_SHELL_NIX_DIR $out/share/nix
  '';

  meta = {
    description = "Add specified programs (apps) on PATH";
    homepage = "https://github.com/imincik/app-shell";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "app-shell";
    platforms = lib.platforms.all;
  };
}
