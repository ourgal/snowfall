{
  confs."settings/ansible/chromebit.json" = {
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
