args:
args.module (
  args
  // (
    let
      inherit (args) enabled enabledList;
    in
    {
      path = ./.;
      progs = {
        nixvim = {
          plugins = {
            lsp = enabled // {
              servers =
                enabledList [
                  "pyright"
                  "marksman"
                  "nil-ls"
                  "bashls"
                  "csharp-ls"
                  "lua-ls"
                  "html"
                  "rust-analyzer"
                ]
                // {
                  rust-analyzer = enabled // {
                    installCargo = true;
                    installRustc = true;
                  };
                };
            };
          };
        };
      };
    }
  )
)
