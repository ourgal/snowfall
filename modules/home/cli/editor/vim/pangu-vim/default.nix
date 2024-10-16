{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs = {
        vim = {
          plugins = with pkgs.${namespace}; [ pangu-vim ];
          extraConfig = ''
            let g:pangu_rule_date = 1
            autocmd InsertLeave,TextChanged *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing('ALL')
          '';
        };
      };
    }
  )
)
