args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs;
    in
    {
      myPkgs = "espanso";
      confs = {
        "espanso/config/default.yml" = { };
        "espanso/match" = [
          ./github.yml
          ./git.yml
          ./translate.yml
          ./markdown.yml
        ];
      };
      systemdServices.espanso = {
        type = "exec";
        startPre = "${pkgs.coreutils-full}/bin/sleep 10";
        start = "${pkgs.${namespace}.espanso}/bin/espanso daemon";
        restart = "on-failure";
      };
    }
  )
)
