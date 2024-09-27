{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "git-ink";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "davidosomething";
    repo = "git-ink";
    rev = version;
    hash = "sha256-OiAajjMXyLezEXNxmHnwZZBP0lZEYmRGUkxh6xEoThw=";
  };

  installPhase = ''
    runHook preInstall
    install -m755 -D git-ink $out/bin/git-ink
    runHook postInstall
  '';

  meta = with lib; {
    description = "Annotate your git branches";
    homepage = "https://github.com/davidosomething/git-ink";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-ink";
    platforms = platforms.all;
  };
}
