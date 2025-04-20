{
  path = ./.;
  nixPkgs = "manix";
  progs.fish.functions.fzf-manix = {
    body = ''
      manix "" | grep '^# ' | sed 's/^# \(.*\) (.*/\1/;s/ (.*//;s/^# //' | fzf --preview="manix '{}'" | xargs manix
    '';
    description = "fzf manix";
  };
}
