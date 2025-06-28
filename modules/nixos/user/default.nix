{
  config,
  lib,
  pkgs,
  namespace,
  options,
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
  duplicatePorts = lib.pipe options.${namespace}.user.ports.definitionsWithLocations [
    # Expand entries with multiple ports into individual port entries
    (lib.concatMap (
      entry:
      map (port: {
        file = entry.file;
        port = port;
      }) entry.value
    ))
    (lib.groupBy (entry: toString entry.port))
    (lib.filterAttrs (_port: entries: builtins.length entries > 1))
    (lib.mapAttrsToList (
      port: entries:
      "Duplicate port ${port} found in:\n" + lib.concatMapStrings (entry: "  - ${entry.file}\n") entries
    ))
    (lib.concatStrings)
  ];
in
{
  options.${namespace}.user = with types; {
    name = mkOpt' str "zxc";
    host = mkOpt' settings.hostType null;
    sshKeys = mkOpt' attrs {
      home = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKh/IvmV+xANBHNefAhW395MyRG2Z9gjg+1Wj7gr15TQ zxc@home";
      surface = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7yaID+Y+VigvaMEE+DmWXvzk1cpUckTM8HNkt/e2TS zxc@surface";
      homeTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKXfKLJn7V0doSMw/B9c06hHuC4QyUoqXBeHOVBSUzikK8Mx05KTZ/vP56oRLufycEWh231UlRNNT/tAJxUGXG4= zxc@home";
      surfaceTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK4Vmz7OBbHKVXZPeJ9AD2H4UPbogSDn2qU14ZDEiShu2cdnBxM1VT4hye3kLvd5cGv0rCzeswzhpy00YRItiYg= zxc@surface";
      airTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDzUqUSlLW5aVxSYjuE4FSniaKl5S3KmFO1V58lLyJh9WddEwqH/phTlxKA8KWRHDFdEge96LVHM6t/aeLZb52c= zxc@air";
      m6 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPIvQOmpSPfRNMU17258cVsM08oSGOB/d01d+nQR087I u0_a420@localhost";
      nuc = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeK+BbH3sS+809Q4bUWph1QFIPLIQMxWz5BU0MRDOyb2WKmK+83mXxNbpTf8bR+O5bnf9e8E/o16pKmDjGQ3mcOinBjrRc2d561lfXqtQ33WJwWVlrY+dEaaimldUxF3P9T29/DIKWIL+7u/gFwZuveEBJ7peSxcbjN0U+qk6BzKrS6TKA+IlGL6464dDNjdL5lcmea+1Oo6VIFUJVF9Ihh3DRTaciHJ17jTA2K2sx+rBrLYZ7PpdV0Sf6/slUiYppWTajmgB+h4vX9aSa0rU7jwDeSHhav+CYqxyHVVJlKZQYEABDYrC1uCGVtXEAy2+fEdIjjzpT+0F4bQSqZzNuNBzYs0EPgEy1EawmIzWO12MLpjnJ555BO6wxNZvOd7R/+Jgsdt27O3j/2vFthOI7+kUVHVSQfmq6KVOX6Qdk90MFi8CukpCo5gzgtpSjdgRR/Vrl0MJeWoyallVhcNpOr3oDCtY51m2WoBmycKYZtoRNw+5h8cu8rz6E2aH62zE= zxc@nuc";
      m6NixOnDroid = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEzosd4z2sZWxQFy4LpFFC3fSbLX8m4THJqESJkIIJaH nix-on-droid@localhost";
    };
    duckdns = {
      token = mkOpt' str (lib.strings.fileContents ./duckdns_token.key);
      domain = mkOpt' str (lib.strings.fileContents ./duckdns_domain.key);
    };
    ports = mkOpt' (listOf port) [ ];
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
    assertions = [
      {
        assertion = duplicatePorts == "";
        message = duplicatePorts;
      }
    ];
  };
}
