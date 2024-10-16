{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs = {
        vim = {
          plugins = with pkgs.vimPlugins; [ vim-qf ];
          extraConfig = ''
            nmap <F5> <Plug>(qf_qf_toggle)
            nmap <Home> <Plug>(qf_qf_previous)
            nmap <End>  <Plug>(qf_qf_next)
            let g:qf_mapping_ack_style = 1
          '';
        };
      };
    }
  )
)
