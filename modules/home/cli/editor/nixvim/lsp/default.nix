{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = with args; {
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
