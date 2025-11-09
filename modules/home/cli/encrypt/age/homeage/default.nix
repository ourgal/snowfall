args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      value = {
        homeage = {
          # Absolute path to identity (created not through home-manager)
          identityPaths = [ "/media/key/keys.txt" ];

          # "activation" if system doesn't support systemd
          installationType = "systemd";

          file."sshkey_zxc" = {
            source = ./zxc.age;
            symlinks = [ "${config.home.homeDirectory}/.ssh/zxc" ];
          };
          file."sshkey_zxc_pub" = {
            source = ./zxc.pub.age;
            symlinks = [ "${config.home.homeDirectory}/.ssh/zxc.pub" ];
          };
        };
      };
    }
  )
)
