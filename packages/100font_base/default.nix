{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "100font-base";
  version = "unstable-2025-09-10";

  src = fetchFromGitHub {
    owner = "ourgal";
    repo = "100font_base";
    rev = "84712ca35f80a687091c34adb37ed99dd9cfae35";
    hash = "sha256-vLvnz5Ny0wWW37RxTwPLNdiZhVpgUd834CV1ne4jnT8=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm0644 fonts/* -t $out/share/fonts/100font_base
    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "https://github.com/ourgal/100font_base";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
