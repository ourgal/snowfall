args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        pkgs
        lib
        namespace
        inputs
        cfgHome
        ;
      inherit (lib.${namespace}) mkOpt' switch;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      value = {
        nix = {
          channels = { inherit (inputs) nixpkgs; };
          nixPath = [ "$HOME/.nix-defexpr/channels" ];
        };
        home.preferXdgDirectories = true;
        home.activation.report-changes = config.lib.dag.entryAnywhere ''
          if [[ -e $currentGenGcPath ]]; then
            ${lib.getExe pkgs.nvd} diff $oldGenPath $newGenPath
          fi
        '';
        xdg.configFile = lib.mkIf cfg.conf.enable {
          "nix/nix.conf".text =
            let
              mirrorUrls =
                if cfg.mirror == "nju" then
                  "https://mirror.nju.edu.cn/nix-channels/store"
                else if cfg.mirror == "cernet" then
                  "https://mirrors.cernet.edu.cn/nix-channels/store"
                else
                  "";
              aaglUrls = "https://ezkea.cachix.org";
              aaglKeys = "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=";
            in
            ''
              substituters = ${mirrorUrls} https://cache.nixos.org ${aaglUrls}
              trusted-substituters = ${mirrorUrls} https://cache.nixos.org ${aaglUrls}
              trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= ${aaglKeys}
            '';
        };
      };
      extraOpts = {
        mirror = mkOpt' (lib.types.enum [
          "cernet"
          "nju"
          "none"
        ]) "none";
        conf = switch;
      };
    }
  )
)
