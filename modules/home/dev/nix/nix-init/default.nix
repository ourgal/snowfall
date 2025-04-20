args:
args.module (
  args
  // (
    let
      inherit (args) config namespace;
    in
    {
      nixPkgs = "nix-init";
      confs."nix-init/config.toml" = {
        maintainers = [ config.${namespace}.user.name ];
        access-tokens."github.com".file = "${config.xdg.configHome}/github/token";
      };
    }
  )
)
