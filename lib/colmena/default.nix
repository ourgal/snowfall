{ inputs, ... }:
let
  nodeDeployments = {
    air = {
      tags = [
        "laptop"
        "desktop"
        "x86_64"
      ];
    };
    surface = {
      tags = [
        "laptop"
        "desktop"
        "x86_64"
      ];
    };
    home = {
      tags = [
        "desktop"
        "x86_64"
      ];
    };
    router = {
      tags = [ "x86_64" ];
    };
    brix = {
      tags = [ "x86_64" ];
    };
    yanyu = {
      tags = [ "x86_64" ];
    };
    n1 = {
      tags = [ "aarch64" ];
    };
    t4 = {
      tags = [ "aarch64" ];
    };
    macmini = {
      tags = [ "aarch64" ];
    };
  };
in
{
  mkColmenaHive =
    nixpkgs:
    let
      confs = inputs.self.nixosConfigurations;
      colmenaConf = {
        meta = {
          inherit nixpkgs;
          nodeNixpkgs = builtins.mapAttrs (_name: value: value.pkgs) confs;
          nodeSpecialArgs = builtins.mapAttrs (_name: value: value._module.specialArgs) confs;
        };
      }
      // builtins.mapAttrs (nodeName: value: {
        imports = value._module.args.modules;
        deployment = nodeDeployments.${nodeName} or { };
      }) confs;
    in
    inputs.colmena.lib.makeHive colmenaConf;
}
