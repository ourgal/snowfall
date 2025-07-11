args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
      isSshSplit = config.${namespace}.cli.multiplexer.tmux.ssh-split.enable;
      isMoxideEnable = config.${namespace}.cli.multiplexer.tmux.moxide.enable;
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
      moxideBinding =
        if isMoxideEnable then "bind m display-popup -B -E -w 40% -h 13 ${moxideScript}" else "";
      baseConf = ''
        set -g default-terminal "tmux-256color"
        set -ag terminal-overrides ",xterm-256color:RGB"
        # set -g history-limit 20000
        set -g buffer-limit 20
        set -sg escape-time 0
        set -g display-time 1500
        set -g remain-on-exit off
        set -g repeat-time 300
        setw -g allow-rename off
        setw -g automatic-rename on
        set-option -g automatic-rename-format "#{?#{||:#{==:#{pane_current_command},zsh},#{==:#{pane_current_command},fish}},#{b:pane_current_path},#{pane_current_command}}"
        set -g focus-events on
        setw -g aggressive-resize on

        set -gq allow-passthrough on

        set -ga update-environment TERM
        set -ga update-environment TERM_PROGRAM

        # Set parent terminal title to reflect current window in tmux session
        set -g set-titles on
        set -g set-titles-string "#I:#W"

        # Start index of window/pane with 1, because we're humans, not computers
        set -g base-index 1
        setw -g pane-base-index 1

        # Enable mouse support
        set -g mouse on

        set -g status-position top

        # ==========================
        # ===   Key bindings     ===
        # ==========================

        # unbind default key bindings, we're going to override
        unbind "\$" # rename-session
        unbind ,    # rename-window
        unbind %    # split-window -h
        unbind '"'  # split-window
        unbind \}    # swap-pane -D
        unbind \{    # swap-pane -U
        unbind [    # paste-buffer
        unbind ]
        unbind "'"  # select-window
        unbind n    # next-window
        unbind p    # previous-window
        unbind c    # new-window
        unbind l    # last-window
        unbind M-n  # next window with alert
        unbind M-p  # next window with alert
        unbind o    # focus thru panes
        unbind &    # kill-window
        unbind "#"  # list-buffer
        unbind =    # choose-buffer
        # unbind z    # zoom-pane
        unbind M-Up  # resize 5 rows up
        unbind M-Down # resize 5 rows down
        unbind M-Right # resize 5 rows right
        unbind M-Left # resize 5 rows left
        unbind b
        unbind s # choose session
        unbind w # choose window
        unbind . # move window
        unbind i # display window information
        unbind f # search for a pane

        # new window and retain cwd
        bind n new-session
        bind p paste-buffer
        ${if isSshSplit then "" else ''bind-key "c" new-window - c "#{pane_current_path}"''}

        ${moxideBinding}

        # Rename session and window
        bind r command-prompt -I "#{window_name}" "rename-window '%%'"
        bind R command-prompt -I "#{session_name}" "rename-session '%%'"

        bind w choose-session
        bind = command-prompt -I "#{move-window}" "move-window '%%'"

        bind-key -r "<" swap-window -d -t -1
        bind-key -r ">" swap-window -d -t +1

        # bind-key -n M-1 select-window -t 1
        # bind-key -n M-2 select-window -t 2
        # bind-key -n M-3 select-window -t 3
        # bind-key -n M-4 select-window -t 4
        # bind-key -n M-5 select-window -t 5
        # bind-key -n M-6 select-window -t 6
        # bind-key -n M-7 select-window -t 7
        # bind-key -n M-8 select-window -t 8
        # bind-key -n M-9 select-window -t 9

        # Split panes
        ${if isSshSplit then "" else ''bind-key "v" split-window -h -c "#{pane_current_path}"''}
        bind-key "V" split-window -fh -c "#{pane_current_path}"
        ${if isSshSplit then "" else ''bind-key "s" split-window -v -c "#{pane_current_path}"''}
        bind-key "S" split-window -fv -c "#{pane_current_path}"

        # Kill pane/window/session shortcuts
        bind x kill-window
        bind C-x confirm-before -p "kill other windows? (y/n)" "kill-window -a"
        set -g detach-on-destroy off
        bind X confirm-before -p "kill-session #S? (y/n)" kill-session

        # Detach from session
        bind d detach
        bind D if -F '#{session_many_attached}' \
            'confirm-before -p "Detach other clients? (y/n)" "detach -a"' \
            'display "Session has only 1 client attached"'

        # bind Space if-shell -F '#{==:#{session_name},popup}' {
        #     detach-client
        # } {
        #     popup -d '#{pane_current_path}' -xC -yC -w 80% -h 80% -E "tmux attach -t popup || tmux new -s popup"
        # }

        # ================================================
        # ===     Copy mode, scroll and clipboard      ===
        # ================================================

        set -g @copy_use_osc52_fallback on

        # Prefer vi style key table
        setw -g mode-keys vi

        # trigger copy mode by
        bind b copy-mode
      '';
    in
    {
      progs.tmux.plugins = [
        {
          plugin = pkgs.tmuxPlugins.yank;
          extraConfig = ("set -g @yank_action 'copy-pipe'" + "\n" + baseConf);
        }
      ];
    }
  )
)
