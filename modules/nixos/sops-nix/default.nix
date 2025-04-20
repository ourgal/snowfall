args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule;
  owner = config.${namespace}.user.name;
  value = {
    sops = {
      age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      defaultSopsFile = lib.snowfall.fs.get-file "secrets/${owner}/default.yaml";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
