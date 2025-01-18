{
  lib,
  stdenv,
  emacs,
  _sources,
}:

stdenv.mkDerivation {
  inherit (_sources.lisp-format) pname version src;

  buildInputs = [ emacs ];

  dontBuild = true;

  installPhase = ''
    install -Dm744 lisp-format $out/bin/lisp-format
  '';

  meta = {
    description = "A tool to format lisp code.  Designed to mimic clang-format";
    homepage = "https://github.com/eschulte/lisp-format";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "lisp-format";
    platforms = lib.platforms.all;
  };
}
