{ inputs, ... }:
let
  inherit (builtins) mapAttrs;
in
mapAttrs (_: deployLib: deployLib.deployChecks inputs.self.deploy) inputs.deploy-rs.lib
