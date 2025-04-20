{
  path = ./.;
  progs.kakoune = {
    config = {
      autoComplete = [
        "insert"
        "prompt"
      ];
      autoInfo = [
        "command"
        "onkey"
      ];
      colorScheme = "tomorrow-night";
      autoReload = "yes";
      wrapLines = {
        enable = true;
        marker = "⏎";
        word = true;
      };
      numberLines = {
        enable = true;
        highlightCursor = true;
        relative = true;
      };
      ui = {
        enableMouse = true;
        assistant = "none";
      };
      keyMappings = [ ];
      hooks = [
        # tab for competition
        {
          name = "InsertCompletionShow";
          commands = ''
            try %{
                # this command temporarily removes cursors preceded by whitespace;
                # if there are no cursors left, it raises an error, does not
                # continue to execute the mapping commands, and the error is eaten
                # by the `try` command so no warning appears.
                execute-keys -draft 'h<a-K>\h<ret>'
                map window insert <tab> <c-n>
                map window insert <s-tab> <c-p>
                hook -once -always window InsertCompletionHide .* %{
                    unmap window insert <tab> <c-n>
                    unmap window insert <s-tab> <c-p>
                }
            }
          '';
          option = ".*";
        }
        # auto save
        {
          name = "BufCreate";
          option = "/.*";
          commands = ''
            hook buffer NormalIdle .* %{
                try %{
                    eval %sh{ [ "$kak_modified" = false ] && printf 'fail' }
                    write
                }
            }
          '';
        }
        {
          name = "WinSetOption";
          option = "filetype=nix";
          commands = ''
            set-option window formatcmd nixfmt

            hook -group nix-auto-format window BufWritePre .* format

            hook -once -always WinSetOption filetype=.* %{
                unset-option window formatcmd
                remove-hooks window nix-auto-format
            }
          '';
        }
        {
          name = "BufWritePre";
          option = ".*";
          commands = ''
            evaluate-commands %sh{
                if [ -n "$kak_opt_formatcmd" ]; then
                    echo format
                fi
            }
          '';
        }
      ];
    };
  };
  enable = [
    # keep-sorted start
    "auto-pairs-kak"
    "fzf-kak"
    "kak-lsp"
    # keep-sorted end
  ];
}
