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
        "comment"
        "file-management"
        "format"
        "git"
        "help"
        "integration"
        "jump"
        "lang"
        "lsp"
        "motion"
        "multi-cursor"
        "pair"
        "picker"
        "preview"
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
      tmpfiles = [
        "d ${config.xdg.dataHome}/vim - - - - -"
        "d ${config.home.homeDirectory}/.cache/vim - - - - -"
      ];
      confs."vim/vimrc" = "";
    }
  )
)
