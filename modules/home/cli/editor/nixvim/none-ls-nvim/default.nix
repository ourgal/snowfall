{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      progs = {
        nixvim = {
          plugins = {
            none-ls = enabled // {
              cmd = [ "bash -c nvim" ];
              debug = true;
              sources = {
                code_actions = {
                  statix = enabled;
                  gitsigns = enabled;
                };
                diagnostics = {
                  statix = enabled;
                  deadnix = enabled;
                  pylint = enabled;
                  checkstyle = enabled;
                };
                formatting = {
                  alejandra = enabled;
                  stylua = enabled;
                  shfmt = enabled;
                  nixpkgs_fmt = enabled;
                  google_java_format.enable = false;
                  prettier = enabled // {
                    disableTsServerFormatter = true;
                  };
                  black = enabled // {
                    withArgs = ''
                      {
                        extra_args = { "--fast" },
                      }
                    '';
                  };
                };
                completion = {
                  luasnip = enabled;
                  spell = enabled;
                };
              };
            };
          };
        };
      };
    }
  )
)
