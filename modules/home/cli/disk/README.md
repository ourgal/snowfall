# cli disk

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## udiskie

Removable disk automounter for udisks.
[github](https://github.com/coldfix/udiskie)
`$ udiskie --help`

```
udiskie: a user-level daemon for auto-mounting.

Usage:
    udiskie [options]
    udiskie (--help | --version)

General options:
    -c FILE, --config=FILE                  Set config file
    -C, --no-config                         Don't use config file

    -v, --verbose                           Increase verbosity (DEBUG)
    -q, --quiet                             Decrease verbosity

    -h, --help                              Show this help
    -V, --version                           Show version information

Daemon options:
    -a, --automount                         Automount new devices
    -A, --no-automount                      Disable automounting

    -n, --notify                            Show popup notifications
    -N, --no-notify                         Disable notifications

    -t, --tray                              Show tray icon
    -s, --smart-tray                        Auto hide tray icon
    -T, --no-tray                           Disable tray icon
    -m MENU, --menu MENU                    Tray menu [flat/nested]

    --appindicator                          Use appindicator for status icon
    --no-appindicator                       Don't use appindicator

    --password-cache MINUTES                Set password cache timeout
    --no-password-cache                     Disable password cache

    -f PROGRAM, --file-manager PROGRAM      Set program for browsing
    -F, --no-file-manager                   Disable browsing

    --terminal COMMAND                      Set terminal command line
                                            (e.g. "termite -d")
    --no-terminal                           Disable terminal action

    -p COMMAND, --password-prompt COMMAND   Command for password retrieval
    -P, --no-password-prompt                Disable unlocking

    --event-hook COMMAND                    Command to execute on events
    --no-event-hook                         Disable command notifications

    --menu-checkbox-workaround              Use checkbox workaround
    --no-menu-checkbox-workaround           Disable checkbox workaround

    --menu-update-workaround                Use wayland menu workaround
    --no-menu-update-workaround             Disable wayland menu workaround

[DEPRECATED]:
    --notify-command COMMAND                Renamed to --event-hook
    --no-notify-command                     Renamed to --no-event-hook

Note, that the options in the individual groups are mutually exclusive.

The config file can be a JSON or preferably a YAML file. For an
example, see the MAN page (or doc/udiskie.8.txt in the repository).
```

```nix tangle:default.nix
    enable = "udiskie";
    nixPkgs = [
      # keep-sorted start
```

## compsize

Btrfs: Find compression type/ratio on a file or set of files.
[github](https://github.com/kilobyte/compsize)

```nix tangle:default.nix
      "compsize"
```

## ventoy

New Bootable USB Solution.
[official site](https://www.ventoy.net/)
`$ ventoy --help`

```
**********************************************
      Ventoy: 1.0.99  x86_64
      longpanda admin@ventoy.net
      https://www.ventoy.net
**********************************************

Usage:  Ventoy2Disk.sh CMD [ OPTION ] /dev/sdX
  CMD:
   -i  install Ventoy to sdX (fails if disk already installed with Ventoy)
   -I  force install Ventoy to sdX (no matter if installed or not)
   -u  update Ventoy in sdX
   -l  list Ventoy information in sdX

  OPTION: (optional)
   -r SIZE_MB  preserve some space at the bottom of the disk (only for install)
   -s/-S       enable/disable secure boot support (default is enabled)
   -g          use GPT partition style, default is MBR (only for install)
   -L          Label of the 1st exfat partition (default is Ventoy)
   -n          try non-destructive installation (only for install)

```

```nix tangle:default.nix
      "ventoy-bin-full"
      # keep-sorted end
    ];
  }
)
```
