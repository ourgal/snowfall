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
        enableSshSupport = true;
        enableFishIntegration = true;
        pinentry = {
          program = "pinentry-qt";
          package = pkgs.pinentry-qt;
        };
      };
      progs.gpg = {
        settings = {
          # https://github.com/drduh/YubiKey-Guide/blob/master/config/gpg.conf
          keyid-format = "0xlong"; # Long key id format
          with-fingerprint = true; # Display all keys and their fingerprints
          personal-cipher-preferences = "AES256 AES192 AES"; # Use AES256, 192, or 128 as cipher
          personal-digest-preferences = "SHA512 SHA384 SHA256"; # Use SHA512, 384, or 256 as digest
          personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed"; # Use ZLIB, BZIP2, ZIP, or no compression
          default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed"; # Default preferences for new keys
          cert-digest-algo = "SHA512"; # SHA512 as digest to sign keys
          s2k-digest-algo = "SHA512"; # SHA512 as digest for symmetric ops
          s2k-cipher-algo = "AES256"; # AES256 as cipher for symmetric ops
          charset = "utf-8"; # UTF-8 support for compatibility
          no-comments = true; # No comments in messages
          no-emit-version = true; # No version in output
          no-greeting = true; # Disable banner
          list-options = "show-uid-validity"; # Display UID validity
          verify-options = "show-uid-validity"; # Display UID validity
          require-cross-certification = true; # Cross-certify subkeys are present and valid
          require-secmem = true; # Enforce memory locking to avoid accidentally swapping GPG memory to disk
          no-symkey-cache = true; # Disable caching of passphrase for symmetrical ops
          armor = true; # Output ASCII instead of binary
          use-agent = true; # Enable smartcard
          throw-keyids = true; # Disable recipient key ID in messages (WARNING: breaks Mailvelope)
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
