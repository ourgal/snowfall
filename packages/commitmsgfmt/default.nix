{
  lib,
  writeShellApplication,
  commitmsgfmt,
}:

writeShellApplication rec {
  name = "commitmsgfmt-wrapper";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ commitmsgfmt ];

  text = ''
    # This hook script formats the commit message named by the first argument,
    # unless we are merging, in which case the hook does nothing; merges often use
    # constructs that are difficult to guess correctly.
    #
    # The hook does not run when rebasing except for during user actions that
    # explicitly trigger commit message editing (the "reword" or "squash" actions,
    # or amending a commit with the "edit" action).
    #
    # The hook is an alternative to integrating commitmsgfmt with a text editor,
    # for instance via Vim's 'formatprg' option. It works, but is less recommended
    # than integrating with a text editor, since the hook implies complete trust in
    # commitmsgfmt's output.
    #
    # Requires commitmsgfmt(1) in $PATH.

    msg="$1"
    dot_git="$(dirname "$msg")"

    [ ! -f "$dot_git/MERGE_HEAD" ] || exit 0

    tmp="$(mktemp)"
    commitmsgfmt < "$msg" > "$tmp" || {
        printf 1>&2 'Could not reformat commit message.\n'
        exit 1
    }

    mv "$tmp" "$msg" || {
        printf 1>&2 'Could not write reformatted commit message.\n'
        exit 1
    }
  '';
}
