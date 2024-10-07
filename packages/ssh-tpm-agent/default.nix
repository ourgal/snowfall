{
  lib,
  buildGoModule,
  fetchFromGitHub,
  openssl,
  namespace,
}:
let
  pname = "ssh-tpm-agent";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  proxyVendor = true;

  vendorHash = "sha256-Upq8u5Ip0HQW5FGyqhVUT6rINXz2BpCE7lbtk9fPaWs=";

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "SSH agent with support for TPM sealed keys for public key authentication";
    homepage = "https://github.com/Foxboron/ssh-tpm-agent";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ sgo ];
    mainProgram = "ssh-tpm-agent";
  };
}
