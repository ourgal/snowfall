args:
args.module (
  args
  // (
    let
      inherit (args) lib pkgs;
    in
    {
      nixPkgs = "gpg-tui";
      servs.gpg-agent = {
        enableSshSupport = false;
        enableFishIntegration = true;
        pinentry = {
          program = "pinentry-qt";
          package = pkgs.pinentry-qt;
        };
      };
      progs.gpg = {
        settings = {
          keyid-format = "0xlong";
          with-fingerprint = true;
        };
        scdaemonSettings = {
          disable-ccid = true;
          card-timeout = "5";
          pcsc-driver = "${lib.getLib pkgs.pcsclite}/lib/libpcsclite.so";
        };
      };
    }
  )
)
