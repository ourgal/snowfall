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
          plugins = with pkgs.vimPlugins; [ vim-exchange ];
          extraConfig = ''
            nmap cx <Plug>(Exchange)
            xmap X <Plug>(Exchange)
            nmap cxc <Plug>(ExchangeClear)
            nmap cxx <Plug>(ExchangeLine)
          '';
        };
      };
    }
  )
)
