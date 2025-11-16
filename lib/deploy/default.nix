{ inputs, ... }:
let
  inherit (builtins) attrNames foldl';
in
{
  mkDeploy =
    {
      self,
      overrides ? { },
      extraNodes ? { },
    }:
    let
      hosts = self.nixosConfigurations or { };
      names = attrNames hosts;
      nodes = foldl' (
        result: name:
        let
          host = hosts.${name};
          inherit (host.pkgs) system;
          pkgs = import inputs.nixpkgs { inherit system; };
          # nixpkgs with deploy-rs overlay but force the nixpkgs package
          deployPkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              inputs.deploy-rs.overlays.default # or deploy-rs.overlays.default
              (_self: super: {
                deploy-rs = {
                  inherit (pkgs) deploy-rs;
                  lib = super.deploy-rs.lib;
                };
              })
            ];
          };
        in
        result
        // {
          ${name} = (overrides.${name} or { }) // {
            hostname = overrides.${name}.hostname or "${name}.local";
            profiles = (overrides.${name}.profiles or { }) // {
              system = (overrides.${name}.profiles.system or { }) // {
                path = deployPkgs.deploy-rs.lib.activate.nixos host;
              };
            };
            confirmTimeout = 300;
          };
        }
      ) { } names;
    in
    {
      user = "root";
      sshUser = "root";
      nodes = nodes // extraNodes;
    };
}
