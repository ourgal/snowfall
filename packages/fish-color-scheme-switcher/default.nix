{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "fish-color-scheme-switcher";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

  meta = with lib; {
    description = "A fish shell :fish: plugin to switch color schemes :rainbow";
    homepage = "https://github.com/h-matsuo/fish-color-scheme-switcher";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fish-color-scheme-switcher";
    platforms = platforms.all;
  };
}
