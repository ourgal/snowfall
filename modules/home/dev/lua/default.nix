args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "lua"
        "lua-language-server"
        "selene"
        "stylua"
        # keep-sorted end
      ];
      luaPkgs = "luarocks-nix";
      value = {
        # for coc.nvim
        xdg.dataFile.lua-language-server.source = "${pkgs.lua-language-server}/share/lua-language-server";
      };
    }
  )
)
