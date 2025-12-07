args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) settings;
    in
    {
      confs."settings/ansible/chromebit.json" = {
        inherit (settings) userPassword rootPassword;
        apk_packages_installed = [
          # keep-sorted start
          "chezmoi"
          "chromium"
          "fish"
          "mpv"
          # keep-sorted end
        ];
        apk_packages_uninstalled = [ ];
        autostart_services = [
          {
            name = "sshd";
            runlevel = "default";
          }
        ];
        disabled_services = [
          {
            name = "chronyd";
            runlevel = "default";
          }
        ];
      };
    }
  )
)
