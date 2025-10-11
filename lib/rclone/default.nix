_: {
  mkRcloneService =
    {
      name,
      dir,
      pkgs,
      lib,
      ...
    }:
    {
      Unit = {
        Description = "RClone Service ${name}";
        Wants = "network-online.target";
        After = "network-online.target";
      };
      Service = {
        ExecStart = "${lib.getExe pkgs.rclone} mount ${name}: ${dir} --allow-other --dir-cache-time 48h --vfs-cache-max-age 48h --vfs-cache-mode full --vfs-read-chunk-size 10M --vfs-read-chunk-size-limit 512M --buffer-size 512M";
        ExecStop = "${pkgs.fuse}fusermount -uz ${dir}";
        Type = "notify";
        Restart = "always";
        RestartSec = 10;
        RestartSteps = 10;
        RestartMaxDelaySec = 300;
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
}
