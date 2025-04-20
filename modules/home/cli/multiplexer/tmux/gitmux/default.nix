let
  gitmuxConf = builtins.toJSON {
    tmux = {
      symbols = {
        branch = "⎇ ";
        hashprefix = ":";
        ahead = "↑·";
        behind = "↓·";
        staged = "● ";
        conflict = "✖ ";
        modified = "✚ ";
        untracked = "… ";
        stashed = "⚑ ";
        insertions = "Σ";
        deletions = "Δ";
        clean = "✔";
      };
      styles = {
        clear = "#[none]";
        state = "#[fg=red,bold]";
        branch = "#[fg=white,bold]";
        remote = "#[fg=cyan]";
        divergence = "#[fg=yellow]";
        staged = "#[fg=green,bold]";
        conflict = "#[fg=red,bold]";
        modified = "#[fg=red,bold]";
        untracked = "#[fg=magenta,bold]";
        stashed = "#[fg=cyan,bold]";
        insertions = "#[fg=green]";
        deletions = "#[fg=red]";
        clean = "#[fg=green,bold]";
      };
      layout = [
        "branch"
        "divergence"
        " - "
        "flags"
      ];
      options = {
        branch_max_len = 0;
        branch_trim = "right";
        ellipsis = "…";
        hide_clean = false;
        swap_divergence = false;
      };
    };
  };
in
{
  path = ./.;
  nixPkgs = "gitmux";
  files.".gitmux.conf" = gitmuxConf;
  confs."gitmux/config.yaml" = gitmuxConf;
}
