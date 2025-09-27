{ inputs, ... }:
{
  mkColmenaHive =
    nixpkgs: nodeDeployments:
    let
      confs = inputs.self.nixosConfigurations;
      colmenaConf =
        {
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
