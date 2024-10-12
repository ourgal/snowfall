{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "todo-comments-fish";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

  meta = with lib; {
    description = "List and search for TODO: like comments in the cwd";
    homepage = "https://github.com/kpbaks/todo-comments.fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "todo-comments-fish";
    platforms = platforms.all;
  };
}
