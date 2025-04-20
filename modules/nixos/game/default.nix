args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace})
    nixosModule
    switch
    enabled
    cfgNixos
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    programs.steam = {
      inherit (cfg.steam) enable;
      gamescopeSession = enabled;
    };

    programs.gamemode = enabled;

    networking.extraHosts = lib.mkIf cfg.aagl.enable ''
      0.0.0.0 overseauspider.yuanshen.com
      0.0.0.0 log-upload-os.hoyoverse.com

      0.0.0.0 log-upload.mihoyo.com
      0.0.0.0 uspider.yuanshen.com
      0.0.0.0 sg-public-data-api.hoyoverse.com

      0.0.0.0 prd-lender.cdp.internal.unity3d.com
      0.0.0.0 thind-prd-knob.data.ie.unity3d.com
      0.0.0.0 thind-gke-usc.prd.data.corp.unity3d.com
      0.0.0.0 cdp.cloud.unity3d.com
      0.0.0.0 remote-config-proxy-prd.uca.cloud.unity3d.com
    '';

    services.minecraft-server = {
      inherit (cfg.minecraft) enable;
      eula = true;
      package = pkgs.papermc;
    };
  };
  extraOpts = {
    steam = switch;
    aagl = switch;
    minecraft = switch;
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
