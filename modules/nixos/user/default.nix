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
      home = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKh/IvmV+xANBHNefAhW395MyRG2Z9gjg+1Wj7gr15TQ";
      surface = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7yaID+Y+VigvaMEE+DmWXvzk1cpUckTM8HNkt/e2TS";
      homeTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBN1qDy5JZkarq9GWtlsl54k9ppze5kDxQN4f5zoZAynslHdS8r5K2CTiCeL/e2+O115HCDMo4+3KIq0sVLzfNm4=";
      surfaceTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMxVxA1nDOq6viqme5MgNLfhIK4zDt6zQO9fKd7TmHmTV09s6ps7s3awZW9DRmX7owxWryeI/Qp/Rr7RN19fsUc=";
      airTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBD49nOsRKfMRDHoFAhj6sEFcgOfn+1q/5R5HX5tAs/VnzXBaq7h/9j0o88o8txh+j52ToRdWRMz+yDoF1gepUlw=";
    };
    duckdns = {
      token = mkOpt' str (lib.strings.fileContents ./duckdns_token.key);
      domain = mkOpt' str (lib.strings.fileContents ./duckdns_domain.key);
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
