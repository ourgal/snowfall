args:
args.module (
  args
  // (
    let
      inherit (args) lib;
      hotmail = lib.strings.fileContents ./hotmail.key;
    in
    {
      path = ./.;
      nixPkgs = "oama";
      progs.msmtp = {
        extraConfig = ''
          defaults
          auth           on
          tls            on
          tls_trust_file /etc/ssl/certs/ca-certificates.crt
          logfile        ~/.msmtp.log
        '';
        extraAccounts = ''
          account        hotmail
          host           smtp-mail.outlook.com
          port           587
          tls_starttls   on
          from           ${hotmail}
          user           ${hotmail}
          passwordeval   "gopass show --password websites/smtp-mail.outlook.com/${hotmail}"

          account default: hotmail
        '';
      };
    }
  )
)
