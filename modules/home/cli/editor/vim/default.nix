args:
args.module (
  args
  // (
    let
      inherit (args) config namespace;
      inherit (config.${namespace}.cli.editor.vim.motion.n) is-vim;
      inherit (builtins) readFile;
    in
    {
      path = ./.;
      progs.vim.extraConfig =
        (readFile ./option.vim)
        + (readFile ./keymap.vim)
        + (readFile ./macro.vim)
        + (
          if is-vim.enable then
            ""
          else
            ''
              nnoremap n nzzzv
              nnoremap N Nzzzv
            ''
        );
      enable = [
        # keep-sorted start
        "align"
        "annotate"
        "auto-save"
        "command"
        "comment"
        "format"
        "git"
        "integration"
        "jump"
        "lang"
        "lint"
        "lsp"
        "mark"
        "motion"
        "multi-cursor"
        "pair"
        "picker"
        "quickfix"
        "register"
        "search"
        "session"
        "snippet"
        "tabline"
        "template"
        "theme"
        "ui"
        "undo"
        "visual"
        # keep-sorted end
      ];
      tmpfiles = [ "d ${config.xdg.dataHome}/vim - - - - -" ];
    }
  )
)
