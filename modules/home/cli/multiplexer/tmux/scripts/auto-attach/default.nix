{
  progs.fish = {
    interactiveShellInit = ''
      if command -v tmux >/dev/null 2>&1; and \
          test -z "$TMUX"; and \
          test -z $INSIDE_EMACS; and \
          test -z $VIM; and \
          test -z $VSCODE_RESOLVING_ENVIRONMENT; and \
          test "$TERM_PROGRAM" != 'vscode'; and \
          ! fish_is_root_user
          exec tmux a
      end
    '';
  };
}
