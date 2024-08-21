{ lib, inputs, ... }:
{
  mkDeploy =
    {
      self,
      overrides ? { },
    }:
    let
      hosts = self.nixosConfigurations or { };
      names = builtins.attrNames hosts;
      nodes = lib.foldl (
        result: name:
        let
          host = hosts.${name};
          inherit (host.pkgs) system;
        in
        result
        // {
          ${name} = (overrides.${name} or { }) // {
            hostname = overrides.${name}.hostname or "${name}.local";
            profiles = (overrides.${name}.profiles or { }) // {
              system = (overrides.${name}.profiles.system or { }) // {
                path = inputs.deploy-rs.lib.${system}.activate.nixos host;
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
      inherit nodes;
    };
}
