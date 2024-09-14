{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "auto-renumber-session";
  version = "unstable-2023-03-01";
  rtpFilePath = "tmux-auto-renumber-session.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "T1erno";
    repo = "tmux-auto-renumber-session";
    rev = "19fead0395afdc36830d840249c0c7190ccd8bb9";
    sha256 = "100f1dg1r026w1272mvrvdvwy0pj4c0p053952g6c2skwhh7czq2";
  };
}
