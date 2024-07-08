{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "neomutt";
    confs = {
      neomutt = [
        ./neomuttrc
        ./mappings
        ./settings
        ./colors
        ./mailcap
      ];
    };
    value = {
      sops = {
        secrets = {
          "neomutt/hotmail" = {
            mode = "0600";
            path = "${args.config.xdg.configHome}/neomutt/accounts/hotmail";
          };
        };
      };
    };
  }
)
