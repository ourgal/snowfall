{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "100font-extend";
  version = "unstable-2025-09-10";

  src = fetchFromGitHub {
    owner = "ourgal";
    repo = "100font_extend";
    rev = "8a51df41191ad3aeebeb0e5ea7a60a320392a414";
    hash = "sha256-zKK+Ud1Ujl9aQKWXzLcegjEceq8b4uLi892nXkhV6fo=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm0644 fonts/* -t $out/share/fonts/100font_extend
    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "https://github.com/ourgal/100font_extend";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
