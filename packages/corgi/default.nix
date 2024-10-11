{
  lib,
  stdenv,
  fetchzip,
  pkgs,
  namespace,
}:
let
  pname = "corgi";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = fetchzip {
    url = "https://github.com/junyu-w/corgi/releases/download/v${version}/corgi_v${version}_linux_64-bit.tar.gz";
    hash = "sha256-kKJ09kJvxBqlGRfbTRRHw4hFpKP0sJqsfYvIuUfrJZQ=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D corgi $out/bin/corgi
    runHook postInstall
  '';

  meta = with lib; {
    description = "Corgi is a command-line workflow manager that helps with your repetitive command usages by organizing them into reusable snippet";
    homepage = "https://github.com/junyu-w/corgi";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "corgi";
    platforms = platforms.linux;
  };
}
