{
  progs = [ "home-manager" ];
  value = {
    manual.html.enable = true;
    systemd.user.startServices = "sd-switch";
  };
}
