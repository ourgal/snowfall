args:
args.module (
  args
  // (
    let
      inherit (args) lib pkgs;
    in
    {
      progs.gpg = {
        scdaemonSettings = {
          disable-ccid = true;
          card-timeout = "5";
          pcsc-driver = "${lib.getLib pkgs.pcsclite}/lib/libpcsclite.so";
        };
      };
    }
  )
)
