{
  nixPkgs = "pay-respects";
  progs = {
    bash.bashrcExtra = ''
      eval "$(pay-respects bash --alias fxck)"
    '';
    fish.interactiveShellInit = ''
      pay-respects fish --alias fxck | source
    '';
    zsh.initExtra = ''
      eval "$(pay-respects zsh --alias fxck)"
    '';
  };
}
