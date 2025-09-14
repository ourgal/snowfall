# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (builtins) attrValues;
  enabled = {
    enable = true;
  };
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  hardware.enableRedistributableFirmware = true;

  boot.kernelPatches = [
    {
      name = "pcie-rockchip-config.patch";
      patch = null;
      extraConfig = ''
        PHY_ROCKCHIP_PCIE y
        PCIE_ROCKCHIP_HOST y
      '';
    }
  ];

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     tree
  #   ];
  # };

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.hostName = "t4";
  users.users =
    let
      sshKeys = {
        home = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKh/IvmV+xANBHNefAhW395MyRG2Z9gjg+1Wj7gr15TQ zxc@home";
        surface = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7yaID+Y+VigvaMEE+DmWXvzk1cpUckTM8HNkt/e2TS zxc@surface";
        homeTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKXfKLJn7V0doSMw/B9c06hHuC4QyUoqXBeHOVBSUzikK8Mx05KTZ/vP56oRLufycEWh231UlRNNT/tAJxUGXG4= zxc@home";
        surfaceTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK4Vmz7OBbHKVXZPeJ9AD2H4UPbogSDn2qU14ZDEiShu2cdnBxM1VT4hye3kLvd5cGv0rCzeswzhpy00YRItiYg= zxc@surface";
        airTpm = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDzUqUSlLW5aVxSYjuE4FSniaKl5S3KmFO1V58lLyJh9WddEwqH/phTlxKA8KWRHDFdEge96LVHM6t/aeLZb52c= zxc@air";
        m6 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPIvQOmpSPfRNMU17258cVsM08oSGOB/d01d+nQR087I u0_a420@localhost";
        nuc = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeK+BbH3sS+809Q4bUWph1QFIPLIQMxWz5BU0MRDOyb2WKmK+83mXxNbpTf8bR+O5bnf9e8E/o16pKmDjGQ3mcOinBjrRc2d561lfXqtQ33WJwWVlrY+dEaaimldUxF3P9T29/DIKWIL+7u/gFwZuveEBJ7peSxcbjN0U+qk6BzKrS6TKA+IlGL6464dDNjdL5lcmea+1Oo6VIFUJVF9Ihh3DRTaciHJ17jTA2K2sx+rBrLYZ7PpdV0Sf6/slUiYppWTajmgB+h4vX9aSa0rU7jwDeSHhav+CYqxyHVVJlKZQYEABDYrC1uCGVtXEAy2+fEdIjjzpT+0F4bQSqZzNuNBzYs0EPgEy1EawmIzWO12MLpjnJ555BO6wxNZvOd7R/+Jgsdt27O3j/2vFthOI7+kUVHVSQfmq6KVOX6Qdk90MFi8CukpCo5gzgtpSjdgRR/Vrl0MJeWoyallVhcNpOr3oDCtY51m2WoBmycKYZtoRNw+5h8cu8rz6E2aH62zE= zxc@nuc";
        m6NixOnDroid = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEzosd4z2sZWxQFy4LpFFC3fSbLX8m4THJqESJkIIJaH nix-on-droid@localhost";
      };
    in
    {
      zxc = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
        hashedPassword = "$6$l/D9BaSzaYnuQBsG$DsGEmCOSrFc7ouT7KQoGPdesJyn88dfftTh8TP8k/8wvO4b50dCcaxZwls5dexllp3K8ri1mzyAxO/koMZrzt1";
        openssh.authorizedKeys.keys = attrValues sshKeys;
      };
      root = {
        hashedPassword = "$6$fQ9kPcLF.Ib8hmfa$8/NymO9CKitPafQfyKZRzvhAvTbHsviJZS5yKndVDzR3IKSNwb5lMhqmYo.7FgJXXjOUYVrUAC33ek8A2GtIW0";
        openssh.authorizedKeys.keys = attrValues sshKeys;
      };
    };

  programs.fish.enable = true;

  services.zram-generator = enabled // {
    settings = {
      zram0 = { };
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}
