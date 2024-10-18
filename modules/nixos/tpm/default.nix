args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    security.tpm2 = enabled // {
      pkcs11 = enabled; # expose /run/current-system/sw/lib/libtpm2_pkcs11.so
      tctiEnvironment = enabled; # TPM2TOOLS_TCTI and TPM2_PKCS11_TCTI env variables
    };
    users.users.${user}.extraGroups = [ "tss" ]; # tss group has access to TPM devices
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
