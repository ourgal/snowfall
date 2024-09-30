{
  lib,
  stdenv,
  fetchFromGitHub,
  installShellFiles,
}:

stdenv.mkDerivation {
  pname = "gg";
  version = "unstable-2022-12-28";

  src = fetchFromGitHub {
    owner = "qw3rtman";
    repo = "gg";
    rev = "14e45a8e946eb7a04ebacc07e3a1f1f4235b1cd8";
    hash = "sha256-+8WpnY9oBdDQ4fUj/xtsrx2w6LCfZIQjex+6BEk5qlk=";
  };

  dontBuild = true;

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    runHook preInstall
    install -Dm755 bin/gg $out/bin/gg
    installManPage ./man/gg.1
    runHook postInstall
  '';

  meta = with lib; {
    description = "Git Goodies: At-A-Glance, Efficient, and Aesthetically Pleasing Git Shortcuts";
    homepage = "https://github.com/qw3rtman/gg";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gg";
    platforms = platforms.all;
  };
}
