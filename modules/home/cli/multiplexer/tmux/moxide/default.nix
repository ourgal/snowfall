args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
      moxideScript = pkgs.writeShellScript "moxide_script" ''
        project_emoji="🚀"
        template_emoji="🛠️"
        directory_emoji="📁"

        list=$(moxide list \
            --format-project "$project_emoji {}"\
            --format-template "$template_emoji {}"\
            --format-directory "$directory_emoji {}"
        )

        value=$(echo "$list" | \
            fzf \
            --no-sort \
            --layout reverse \
            --border rounded \
            --border-label "Moxide Sessions" \
            --no-scrollbar \
            --prompt "✨ " \
            --pointer "👉" \
            --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
            --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
            --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
            --color=selected-bg:#45475a
        )

        IFS=' ' read -r emoji name <<< "$value"
        case "$emoji" in
            $project_emoji)
                moxide project start "$name"
                ;;
            $template_emoji)
                moxide template start "$name"
                ;;
            $directory_emoji)
                moxide dir start "$name"
                ;;
        esac
      '';
    in
    {
      nixPkgs = "moxide";
      progs.tmux = {
        extraConfig = "bind m display-popup -B -E -w 40% -h 13 ${moxideScript}";
      };
      value.${namespace}.user.tmux.keys = [ "m" ];
    }
  )
)
