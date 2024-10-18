args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs;
    in
    {
      path = ./.;
      myPkgs = "espanso";
      confs = [
        { "espanso/config" = ./default.yml; }
        {
          "espanso/match" = [
            ./base.yml
            ./github.yml
            ./git.yml
            ./translate.yml
            ./markdown.yml
          ];
        }
      ];
      value = {
        systemd.user.services.espanso = {
          Unit = {
            Description = "Espanso: cross platform text expander in Rust";
          };
          Service = {
            Type = "exec";
            ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 10";
            ExecStart = "${pkgs.${namespace}.espanso}/bin/espanso daemon";
            Restart = "on-failure";
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
        };
      };
    }
  )
)
