args:
args.module (
  args
  // (
    let
      inherit (args) config pkgs;
    in
    {
      path = ./.;
      value = {
        home.activation.report-changes = config.lib.dag.entryAnywhere ''
          ${pkgs.nvd}/bin/nvd diff $oldGenPath $newGenPath
        '';
        xdg.configFile = {
          "nix/nix.conf".text =
            let
              mirrorUrls = "https://mirrors.cernet.edu.cn/nix-channels/store";
              aaglUrls = "https://ezkea.cachix.org";
              aaglKeys = "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=";
            in
            ''
              substituters = http://home.local:50000 ${mirrorUrls} https://cache.nixos.org/ ${aaglUrls}
              trusted-substituters = http://home.local:50000 ${mirrorUrls} https://cache.nixos.org/ ${aaglUrls}
              trusted-public-keys = cache.example.org-1:lFI4YUR1ZKE8dz1JoXTRBvIEHaeKmW3LHBlDTJDW1V8= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= ${aaglKeys}
            '';
        };
      };
    }
  )
)
