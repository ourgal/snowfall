{ ... }@args:
args.module (
  args
  // {
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
        ];
      }
    ];
    value = with args; {
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
      sops = {
        secrets = {
          "espanso/mail.yml" = {
            mode = "0600";
            path = "${config.xdg.configHome}/espanso/match/mail.yml";
          };
        };
      };
    };
  }
)
