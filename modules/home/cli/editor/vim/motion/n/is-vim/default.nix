args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
      inherit (config.${namespace}.cli.editor.vim.motion.n) vim-anzu;
      inherit (config.${namespace}.cli.editor.vim.motion.asterisk) vim-asterisk;
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
          else if vim-asterisk.enable then
            ''
              map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
              map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
              map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
              map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
            ''
          else
            "";
      };
    }
  )
)
