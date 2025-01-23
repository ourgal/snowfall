args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
      inherit (config.${namespace}.cli.editor.vim.motion) is-vim;
    in
    {
      path = ./.;
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ vim-anzu ];
        extraConfig =
          if is-vim.enable then
            ""
          else
            ''
              nmap n <Plug>(anzu-n-with-echo)
              nmap N <Plug>(anzu-N-with-echo)
              nmap * <Plug>(anzu-star-with-echo)
              nmap # <Plug>(anzu-sharp-with-echo)
            '';
      };
    }
  )
)
