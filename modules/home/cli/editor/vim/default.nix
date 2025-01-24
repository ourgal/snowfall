args:
args.module (
  args
  // (
    let
      inherit (args) config namespace;
      inherit (config.${namespace}.cli.editor.vim.motion.n) is-vim;
    in
    {
      path = ./.;
      progs.vim.extraConfig =
        (builtins.readFile ./option.vim)
        + (builtins.readFile ./keymap.vim)
        + (builtins.readFile ./macro.vim)
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
        "auto-save"
        "command"
        "comment"
        "git"
        "integration"
        "jump"
        "lang"
        "lint"
        "lsp"
        "mark"
        "motion"
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
      dataFiles = {
        "vim/.keep" = "";
      };
    }
  )
)
