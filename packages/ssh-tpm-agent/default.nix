{
  lib,
  buildGoModule,
  openssl,
  namespace,
  pkgs,
}:
let
  pname = "ssh-tpm-agent";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname version src;

  proxyVendor = true;

  vendorHash = "sha256-VOEJ5lpYaX2Br7hA6k+MWmF5LHLrBbOGPByyjQ6PhG4=";

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
