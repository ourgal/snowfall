args:
args.module (
  args
  // (
    let
      inherit (args) enabled enabledList;
    in
    {
      path = ./.;
      progs.nixvim.plugins.lsp = enabled // {
        servers =
          enabledList [
            "pyright"
            "marksman"
            "nil_ls"
            "bashls"
            "csharp_ls"
            "lua_ls"
            "html"
            "rust_analyzer"
          ]
          // {
            rust_analyzer = enabled // {
              installCargo = true;
              installRustc = true;
            };
          };
      };
    }
  )
)
