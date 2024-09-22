{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = [
        "lua"
        "lua-language-server"
        "selene"
        "stylua"
      ];
      luaPkgs = "luarocks-nix";
      value = {
        # for coc.nvim
        xdg.dataFile.lua-language-server.source = "${pkgs.lua-language-server}/share/lua-language-server";
      };
    }
  )
)
