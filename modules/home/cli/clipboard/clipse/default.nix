{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "clipse";
      value = {
        systemd.user.services.clipse = {
          Unit = {
            Description = "Clipse daemon";
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
          Service = {
            ExecStart = "${pkgs.clipse}/bin/clipse --listen-shell";
          };
        };
      };
    }
  )
)
