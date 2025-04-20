{
  nixPkgs = "vgrep";
  progs.fish.functions = {
    vgf = {
      body = ''
        set -f INITIAL_QUERY $argv[1]
        vgrep --no-header $INITIAL_QUERY | fzf --ansi --bind "Ctrl-d:half-page-down,Ctrl-u:half-page-up" | awk '{print $1}' | xargs -I{} -o vgrep --show {}
      '';
      description = "vgrep search with fzf";
    };
    vgF = {
      body = ''
        set -f INITIAL_QUERY $argv[1]
        FZF_DEFAULT_COMMAND="vgrep --no-header $INITIAL_QUERY" fzf --bind "Ctrl-d:half-page-down,Ctrl-u:half-page-up,change:reload:vgrep --no-header {q} || true" --ansi --phony --tac --query $INITIAL_QUERY | awk '{print $1}' | xargs -I{} -o vgrep --show {}
      '';
      description = "vgrep search with fzf";
    };
  };
}
