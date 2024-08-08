{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
let
  inherit (lib)
    mkIf
    types
    isString
    isAttrs
    ;
  inherit (builtins) attrValues;
  inherit (lib.${namespace}) mkOpt' cfgNixos settings;
  cfg = cfgNixos config.${namespace} ./.;
in
{
  options.${namespace}.user = with types; {
    name = mkOpt' str "zxc";
    host = mkOpt' settings.hostType null;
    sshKeys = mkOpt' attrs {
      home = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7yaID+Y+VigvaMEE+DmWXvzk1cpUckTM8HNkt/e2TS zxc@surface";
      surface = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKh/IvmV+xANBHNefAhW395MyRG2Z9gjg+1Wj7gr15TQ zxc@home";
      homeTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLCeU1FYLvxg0yph5wf5XCi8hOWkYYximn/a9v7NQVhQbnzU8E+hvi9pcl/BsXeZn2Qgj98YKoyRk06KUbBibDg= zxc@home";
    };
  };

  config = mkIf (isString cfg.name && isString cfg.host && isAttrs cfg.sshKeys) {
    networking.hostName = cfg.host; # Define your hostname.
    users.users = {
      ${cfg.name} = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
        hashedPassword = "$6$l/D9BaSzaYnuQBsG$DsGEmCOSrFc7ouT7KQoGPdesJyn88dfftTh8TP8k/8wvO4b50dCcaxZwls5dexllp3K8ri1mzyAxO/koMZrzt1";
        openssh.authorizedKeys.keys = attrValues config.dot.user.sshKeys;
      };
      root = {
        hashedPassword = "$6$fQ9kPcLF.Ib8hmfa$8/NymO9CKitPafQfyKZRzvhAvTbHsviJZS5yKndVDzR3IKSNwb5lMhqmYo.7FgJXXjOUYVrUAC33ek8A2GtIW0";
        openssh.authorizedKeys.keys = attrValues config.dot.user.sshKeys;
      };
    };
  };
}
