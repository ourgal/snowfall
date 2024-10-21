{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "fzf-help";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit (source) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib
    install -m755 -D src/{cli-options,fzf-help-log,fzf-help.bash,fzf-help.fish,fzf-help.zsh,fzf-select-option,fzf-select-option-preview,help-message,make-temp} $out/lib/
    runHook postInstall
  '';

  meta = with lib; {
    description = "Use fzf to select command line options from `--help";
    homepage = "https://github.com/BartSte/fzf-help";
    changelog = "https://github.com/BartSte/fzf-help/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
