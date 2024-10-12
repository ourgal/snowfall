{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "fish-abbreviation-tips";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Help you remembering your abbreviations";
    homepage = "https://github.com/gazorby/fish-abbreviation-tips";
    changelog = "https://github.com/gazorby/fish-abbreviation-tips/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fish-abbreviation-tips";
    platforms = platforms.all;
  };
}
