{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "crow-translate";
      value = {
        systemd.user.services.crow-translate = {
          Unit = {
            Description = "Crow Translate";
            Wants = "network-online.target";
            After = "network-online.target";
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
          Service = {
            ExecStart = "${pkgs.crow-translate}/bin/crow";
          };
        };
      };
    }
  )
)
