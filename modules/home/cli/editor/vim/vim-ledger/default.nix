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
          plugins = with pkgs.vimPlugins; [ vim-ledger ];
          extraConfig = ''
            let g:ledger_is_hledger = 1
          '';
        };
      };
    }
  )
)
