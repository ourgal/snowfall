{
  writeShellApplication,
  lib,
  broot,
  gnumake,
  tmux,
  lf,
  git,
  ov,
  ...
}:
writeShellApplication rec {
  name = "helix-tmux";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [
    ov
    git
    lf
    tmux
    broot
    gnumake
  ];

  text = builtins.readFile ./helix-tmux.sh;
}
