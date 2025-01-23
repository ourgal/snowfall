args:
args.module (
  args
  // (
    let
      inherit (args) config namespace;
      inherit (config.${namespace}.cli.editor.vim.motion) is-vim;
    in
    {
      path = ./.;
      progs.vim.extraConfig =
        (builtins.readFile ./option.vim)
        + (builtins.readFile ./keymap.vim)
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
        "comment"
        "edit"
        "git"
        "integration"
        "lang"
        "lint"
        "lsp"
        "motion"
        "picker"
        "search"
        "theme"
        "ui"
        # keep-sorted end
      ];
      dataFiles = {
        "vim/.keep" = "";
      };
    }
  )
)
