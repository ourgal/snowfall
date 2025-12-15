{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "ansible-lookup-plugin-gopass";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "christian-heusel";
    repo = "ansible-lookup-plugin-gopass";
    rev = "v${version}";
    hash = "sha256-S4XfA+1WHJHQL9flgNetuXHK12O7EAxDQR5mnUk1Wmw=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 lookup_plugins/gopass.py $out
    runHook postInstall
  '';

  meta = {
    description = "Ansible lookup plugin for gopass (https://www.gopass.pw";
    homepage = "https://github.com/christian-heusel/ansible-lookup-plugin-gopass";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
