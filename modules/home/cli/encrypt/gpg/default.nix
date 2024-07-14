{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "gpg-tui";
    servs = with args; {
      gpg-agent = {
        enableSshSupport = false;
        enableFishIntegration = true;
        pinentryPackage = pkgs.pinentry-all;
      };
    };
    progs = {
      gpg = {
        settings = {
          keyid-format = "0xlong";
          with-fingerprint = true;
        };
      };
    };
  }
)
