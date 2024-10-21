args:
args.module (
  args
  // (
    let
      inherit (args) toTOML config namespace;
    in
    {
      path = ./.;
      nixPkgs = "nix-init";
      confs."nix-init/config.toml" = toTOML {
        maintainers = [ config.${namespace}.user.name ];
        access-tokens."github.com".file = "${config.xdg.configHome}/github/token";
      };
    }
  )
)
