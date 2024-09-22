{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "safeeyes";
      value = {
        systemd.user.services.safeeyes = {
          Unit = {
            Description = "Protect your eyes from eye strain";
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
          Service = {
            ExecStart = "${pkgs.safeeyes}/bin/safeeyes";
            Restart = "always";
            RestartSec = 10;
          };
        };
      };
    }
  )
)
