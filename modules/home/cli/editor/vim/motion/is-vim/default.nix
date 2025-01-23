args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
      inherit (config.${namespace}.cli.editor.vim.motion) vim-anzu;
    in
    {
      path = ./.;
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ is-vim ];
        extraConfig =
          if vim-anzu.enable then
            ''
              map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
              map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
            ''
          else
            "";
      };
    }
  )
)
